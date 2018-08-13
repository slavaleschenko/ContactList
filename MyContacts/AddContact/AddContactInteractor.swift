//
//  AddContactInteractor.swift
//  MyContacts
//
//  Created by Admin on 26.07.18.
//  Copyright © 2018 SlavaLeschenko. All rights reserved.
//

import Foundation
import Contacts

// MARK: - Output

protocol AddContactInteractorOutput: class {
    
//    func contactDidSave()
}

// MARK: - Protocol

protocol AddContactInteractor: class {
    var output: AddContactInteractorOutput? { get set }
    
    func createContact(contact: CNMutableContact)
    func createNewContact() -> NewContact
    func handle(firstName: String)
    func handle(lastName: String)
}

// MARK: - Implementation

private final class AddContactInteractorImpl: AddContactInteractor {
    weak var output: AddContactInteractorOutput?
    private let contactServices: ContactServices
    
    var firstName: String = ""
    var lastName: String = ""
    
    
    
    init(contactServices: ContactServices) {
        self.contactServices = contactServices
    }
    func createContact(contact: CNMutableContact) {
        contactServices.saveContact(contact: contact)
//        self.output?.contactDidSave()

    }
    
    func createNewContact() -> NewContact {
        
        return NewContact(firstName: firstName, lastName: lastName)
    }
    
    
    func handle(firstName: String) {
        self.firstName = firstName
    }
    func handle(lastName: String) {
        self.lastName = lastName
    }
}

// MARK: - Factory

final class AddContactInteractorFactory {
    static func `default`(contactServices: ContactServices) -> AddContactInteractor {
        return AddContactInteractorImpl(contactServices: contactServices)
    }
    
}
