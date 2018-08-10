//
//  ContactListViewController.swift
//  MyContacts
//
//  Created by Admin on 12.07.18.
//  Copyright © 2018 SlavaLeschenko. All rights reserved.
//
import Foundation
import UIKit
import Contacts
import ContactsUI

class ContactListViewController: UIViewController, ContactListPresenterOutput {
    
    fileprivate let presenter: ContactListPresenter
    @IBOutlet weak var tableView: UITableView!
    
    init(presenter: ContactListPresenter) {
        self.presenter = presenter
        super.init(nibName: ContactListViewController.className, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var contacts = [CNContact]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.handleViewIsReady()
        presentSettingsActionSheet()
        fetchContacts(completion: {contacts in
            self.contacts = contacts
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        })
        configureNavigationBar()
        configureTableView()
    }
    
    func fetchContacts(completion: @escaping (_ result: [CNContact]) -> Void) {
        
        
        DispatchQueue.main.async {

            var results = [CNContact]()
            let keys = [CNContactGivenNameKey,CNContactFamilyNameKey,CNContactMiddleNameKey,CNContactEmailAddressesKey,CNContactPhoneNumbersKey] as [CNKeyDescriptor]
            let fetchRequest = CNContactFetchRequest(keysToFetch: keys)
            fetchRequest.sortOrder = .userDefault
            let store = CNContactStore()
            store.requestAccess(for: .contacts, completionHandler: {(grant,error) in
                if grant{
                    do {
                        try store.enumerateContacts(with: fetchRequest, usingBlock: { (contact, stop) -> Void in
                            results.append(contact)
                        })
                    }
                    catch let error {
                        print(error.localizedDescription)
                    }
                    completion(results)
                }else{
                    print("Error \(error?.localizedDescription ?? "")")
                }
            })
        }
    }
    

    func presentSettingsActionSheet() {
        let status : CNAuthorizationStatus = CNContactStore.authorizationStatus(for: CNEntityType.contacts)
        switch status {
        case .authorized:
            return
        case .notDetermined:
            return
        default:
            let alert = UIAlertController(title: "Permission to Contacts", message: "This app needs access to contacts", preferredStyle: .actionSheet)
            alert.addAction(UIAlertAction(title: "Go to Settings", style: .default) { _ in
                let url = URL(string: UIApplicationOpenSettingsURLString)!
                UIApplication.shared.open(url)
            })
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
            present(alert, animated: true)
        }
    }
    
    private func configureTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(ContactCell.nib(), forCellReuseIdentifier: ContactCell.reuseIdentifier())
    }
    
    private func configureNavigationBar() {
        self.title = "Contacts"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addContact))
    }
    
    @objc fileprivate func addContact() {
        presenter.handleAddContact()
    }
    
}
    
    // MARK: - Table view data source
extension ContactListViewController: UITableViewDataSource {
    
//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return contacts.count
//    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return contacts.count
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: ContactCell.reuseIdentifier(), for: indexPath) as! ContactCell
        let currentContact = contacts[indexPath.row]
        cell.contactName.text = "\(currentContact.givenName) \(currentContact.familyName)"
        cell.contactPhone.text = currentContact.phoneNumbers.first?.value.stringValue
        return cell
    }
}

    // MARK: - Table view delegate

extension ContactListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        presenter.handleContactDetail(contact: contacts[indexPath.row])
    }
    
}

// MARK: - Factory

final class ContactListViewControllerFactory {
    static func new(
        presenter: ContactListPresenter
        ) -> ContactListViewController {
        let controller = ContactListViewController(presenter: presenter)
        presenter.output = controller
        return controller
    }
}
