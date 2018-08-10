//
//  ContactListInteractor.swift
//  MyContacts
//
//  Created by Admin on 26.07.18.
//  Copyright © 2018 SlavaLeschenko. All rights reserved.
//

import Foundation
import Contacts

// MARK: - Output

protocol ContactListInteractorOutput: class {}

// MARK: - Protocol

protocol ContactListInteractor: class {
    var output: ContactListInteractorOutput? { get set }
    
    func fetchContacts()
    func addContactInteractor() -> AddContactInteractor?
    func contactDetailInteractor(contact: CNContact) -> ContactDetailInteractor?
}

// MARK: - Implementation

private final class ContactListInteractorImpl: ContactListInteractor {
    weak var output: ContactListInteractorOutput?
    private let contactServices: ContactServices
    
    
    
    init(contactServices: ContactServices) {
        self.contactServices = contactServices
    }
    
    func fetchContacts() {
        contactServices.fetchAllContacts()
    }
    
    func addContactInteractor() -> AddContactInteractor? {
        return AddContactInteractorFactory.default(contactServices: contactServices)
    }
    
    func contactDetailInteractor(contact: CNContact) -> ContactDetailInteractor? {
        
        return ContactDetailInteractorFactory.default(contact: contact)
    }
    
}

// MARK: - Factory

final class ContactListInteractorFactory {
    static func `default`(contactServices: ContactServices = ContactServicesFactory.default()) -> ContactListInteractor {
        return ContactListInteractorImpl(contactServices: contactServices)
    }
}
