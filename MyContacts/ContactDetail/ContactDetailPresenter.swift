//
//  ContactDetailPresenter.swift
//  MyContacts
//
//  Created by Admin on 26.07.18.
//  Copyright © 2018 SlavaLeschenko. All rights reserved.
//

import Foundation
import ContactsUI


// MARK: - Output

protocol ContactDetailPresenterOutput: class {}

// MARK: - Protocol

protocol ContactDetailPresenter: class {
    var output: ContactDetailPresenterOutput? { get set }
    
    func handleViewIsReady()
    func tappedContact() -> [CNContact]
}

// MARK: - Implementation

private final class ContactDetailPresenterImpl: ContactDetailPresenter, ContactDetailInteractorOutput {
    private let interactor: ContactDetailInteractor
    private let router: ContactDetailRouter
    weak var output: ContactDetailPresenterOutput?
    
    var contact = [CNContact]()
    
    init(
        interactor: ContactDetailInteractor,
        router: ContactDetailRouter
        ) {
        self.interactor = interactor
        self.router = router
    }
    
    func handleViewIsReady() {
        
    }
    
    func tappedContact() -> [CNContact] {
         interactor.tappedContact(completion: {contactDetails in
            self.contact.append(contactDetails.first!)
         })
        return contact
    }
}

// MARK: - Factory

final class ContactDetailPresenterFactory {
    static func `default`(
        interactor: ContactDetailInteractor = ContactDetailInteractorFactory.default(contact: CNContact.init()),
        router: ContactDetailRouter
        ) -> ContactDetailPresenter {
        let presenter = ContactDetailPresenterImpl(
            interactor: interactor,
            router: router
        )
        interactor.output = presenter
        return presenter
    }
}
