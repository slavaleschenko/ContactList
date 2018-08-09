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
    
    func addContactInteractor() -> AddContactInteractor?
    func contactDetailInteractor(contact: CNContact) -> ContactDetailInteractor?
}

// MARK: - Implementation

private final class ContactListInteractorImpl: ContactListInteractor {
    weak var output: ContactListInteractorOutput?
    
    func addContactInteractor() -> AddContactInteractor? {
        return AddContactInteractorFactory.default()
    }
    
    func contactDetailInteractor(contact: CNContact) -> ContactDetailInteractor? {
        
        return ContactDetailInteractorFactory.default(contact: contact)
    }
    
}

// MARK: - Factory

final class ContactListInteractorFactory {
    static func `default`() -> ContactListInteractor {
        return ContactListInteractorImpl()
    }
}
