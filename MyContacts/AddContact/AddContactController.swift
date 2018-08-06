//
//  AddContactController.swift
//  MyContacts
//
//  Created by Admin on 26.07.18.
//  Copyright © 2018 SlavaLeschenko. All rights reserved.
//

import Foundation
import UIKit
import Contacts

// MARK: - Implementation

class AddContactController: UIViewController, AddContactPresenterOutput {
    fileprivate let presenter: AddContactPresenter
    
    @IBOutlet weak var firstNameTxt: UITextField!
    @IBOutlet weak var lastNameTxt: UITextField!
    @IBOutlet weak var emailTxt: UITextField!
    
    @IBOutlet weak var bdayDatePicker: UIDatePicker!
    
    
    init(presenter: AddContactPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBar()
        presenter.handleViewIsReady()
    }
    
    @objc func createContact() {
        let newContact = CNMutableContact()
        
        newContact.givenName = firstNameTxt.text!
        newContact.familyName = lastNameTxt.text!
        let email = CNLabeledValue(label: CNLabelHome, value: emailTxt.text! as NSString)
        
        newContact.emailAddresses = [email]
        let bday = NSCalendar.current.dateComponents([Calendar.Component.year, Calendar.Component.month, Calendar.Component.day], from: bdayDatePicker.date)
        
        newContact.birthday = bday
        
        do {
            let store = CNContactStore()
            let saveRequest = CNSaveRequest()
            saveRequest.add(newContact, toContainerWithIdentifier: nil)
            try store.execute(saveRequest)
            
            navigationController?.popViewController(animated: true)
        }
        catch {
            print(error)
        }
    }
    
    private func configureNavigationBar() {
        self.title = "Add Contact"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(createContact))
    }
}

// MARK: - Factory

final class AddContactControllerFactory {
    static func new(
        presenter: AddContactPresenter
        ) -> AddContactController {
        let controller = AddContactController(presenter: presenter)
        presenter.output = controller
        return controller
    }
}
