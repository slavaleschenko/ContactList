//
//  ContactDetailController.swift
//  MyContacts
//
//  Created by Admin on 26.07.18.
//  Copyright © 2018 SlavaLeschenko. All rights reserved.
//

import Foundation
import UIKit
import Contacts

// MARK: - Implementation

class ContactDetailController: UIViewController, ContactDetailPresenterOutput {
    fileprivate let presenter: ContactDetailPresenter
    var contact = [CNContact]()
    
    @IBOutlet weak var firstName: UILabel!
    @IBOutlet weak var lastName: UILabel!
    @IBOutlet weak var age: UILabel!
    
    init(presenter: ContactDetailPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.handleViewIsReady()
        showContactDetails()
    }
    
    func showContactDetails() {
        DispatchQueue.main.async {
            let selectedContact = self.presenter.tappedContact()
//            self.contact.append(selectedContact.first!)
        }
//        contact.append(selectedContact.first!)
        firstName.text = contact.first?.givenName
        lastName.text = contact.first?.familyName
        if contact.first?.birthday?.date == nil {
            age.isHidden = true
        } else {
            age.text = "fix age!!!"
        }
    }
    
}

// MARK: - Factory

final class ContactDetailControllerFactory {
    static func new(
        presenter: ContactDetailPresenter
        ) -> ContactDetailController {
        let controller = ContactDetailController(presenter: presenter)
        presenter.output = controller
        return controller
    }
}
