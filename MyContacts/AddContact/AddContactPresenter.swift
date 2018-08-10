//
//  AddContactPresenter.swift
//  MyContacts
//
//  Created by Admin on 26.07.18.
//  Copyright © 2018 SlavaLeschenko. All rights reserved.
//

import Foundation
import Contacts
// MARK: - Output

protocol AddContactPresenterOutput: class {
    func contactDidUpdate()
}

// MARK: - Protocol

protocol AddContactPresenter: class {
    var output: AddContactPresenterOutput? { get set }
    
    func createContact()
    func getData(firstName: String, lastName: String, email: NSString)
    
    var newContact : CNMutableContact {get set}
}

// MARK: - Implementation

private final class AddContactPresenterImpl: AddContactPresenter, AddContactInteractorOutput {
    private let interactor: AddContactInteractor
    private let router: AddContactRouter
    weak var output: AddContactPresenterOutput?
    
    var newContact = CNMutableContact()
    
    init(
        interactor: AddContactInteractor,
        router: AddContactRouter
        ) {
        self.interactor = interactor
        self.router = router
    }
    
    
    func getData(firstName: String, lastName: String, email: NSString) {
        newContact.givenName = firstName
        newContact.familyName = lastName
        let contactEmail = CNLabeledValue(label: CNLabelHome, value: email)
        newContact.emailAddresses = [contactEmail]
    }
    
    func createContact() {
        interactor.createContact(contact: newContact)
    }
    
    func contactDidSave() {
        self.output?.contactDidUpdate()
    }
}

// MARK: - Factory

final class AddContactPresenterFactory {
    static func `default`(
        interactor: AddContactInteractor,
        router: AddContactRouter
        ) -> AddContactPresenter {
        let presenter = AddContactPresenterImpl(
            interactor: interactor,
            router: router
        )
        interactor.output = presenter
        return presenter
    }
}
