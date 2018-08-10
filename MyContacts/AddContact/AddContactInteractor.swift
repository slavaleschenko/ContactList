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
    
    func contactDidSave()
}

// MARK: - Protocol

protocol AddContactInteractor: class {
    var output: AddContactInteractorOutput? { get set }
    
    func createContact(contact: CNMutableContact)
}

// MARK: - Implementation

private final class AddContactInteractorImpl: AddContactInteractor {
    weak var output: AddContactInteractorOutput?
    private let contactServices: ContactServices
    
    init(contactServices: ContactServices) {
        self.contactServices = contactServices
    }
    func createContact(contact: CNMutableContact) {
        contactServices.saveContact(contact: contact)
        self.output?.contactDidSave()

    }
}

// MARK: - Factory

final class AddContactInteractorFactory {
    static func `default`(contactServices: ContactServices) -> AddContactInteractor {
        return AddContactInteractorImpl(contactServices: contactServices)
    }
    
}
