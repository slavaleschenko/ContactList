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

protocol AddContactOutput: class {
    func didCreateContact(contact: NewContact)
}


protocol AddContactPresenterOutput: class {
    func contactDidUpdate()
}

// MARK: - Protocol

protocol AddContactPresenter: class {
    var output: AddContactPresenterOutput? { get set }
    
    func handle(firstName: String)
    func handle(lastName: String)
    func handleSave()
    
    var newContact : CNMutableContact {get set}
}

// MARK: - Implementation

private final class AddContactPresenterImpl: AddContactPresenter, AddContactInteractorOutput {
    private let interactor: AddContactInteractor
    private let router: AddContactRouter
    weak var output: AddContactPresenterOutput?
    weak var addContactOutput: AddContactOutput?
    
    var newContact = CNMutableContact()
    
    init(
        interactor: AddContactInteractor,
        router: AddContactRouter
        ) {
        self.interactor = interactor
        self.router = router
    }
    
    func handle(lastName: String) {
        interactor.handle(lastName: lastName)
    }
    
    func handle(firstName: String) {
        interactor.handle(firstName: firstName)
    }
    
    func handleSave() {
        addContactOutput?.didCreateContact(contact: interactor.createNewContact())
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
