//
//  ContactListPresenter.swift
//  MyContacts
//
//  Created by Admin on 26.07.18.
//  Copyright © 2018 SlavaLeschenko. All rights reserved.
//

import Foundation

// MARK: - Output

protocol ContactListPresenterOutput: class {
    
}

// MARK: - Protocol

protocol ContactListPresenter: class {
    var output: ContactListPresenterOutput? { get set }
    
    func handleViewIsReady()
    func handleAddContact()
}

// MARK: - Implementation

private final class ContactListPresenterImpl: ContactListPresenter, ContactListInteractorOutput {
    private let interactor: ContactListInteractor
    private let router: ContactListRouter
    weak var output: ContactListPresenterOutput?
    
    init(
        interactor: ContactListInteractor,
        router: ContactListRouter
        ) {
        self.interactor = interactor
        self.router = router
    }
    
    func handleViewIsReady() {
        
    }
    
    func handleAddContact() {
        guard let addContactInteractor = interactor.addContactInteractor() else { return }
        let addContactRouter = router.addContactRouter()
        let addContactPresenter = AddContactPresenterFactory.default(interactor: addContactInteractor, router: addContactRouter)
        router.routeToAddContact(presenter: addContactPresenter)
    }
}

// MARK: - Factory

final class ContactListPresenterFactory {
    static func `default`(
        interactor: ContactListInteractor = ContactListInteractorFactory.default(),
        router: ContactListRouter
        ) -> ContactListPresenter {
        let presenter = ContactListPresenterImpl(
            interactor: interactor,
            router: router
        )
        interactor.output = presenter
        return presenter
    }
}
