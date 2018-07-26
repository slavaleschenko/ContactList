//
//  ContactDetailPresenter.swift
//  MyContacts
//
//  Created by Admin on 26.07.18.
//  Copyright © 2018 SlavaLeschenko. All rights reserved.
//

import Foundation

// MARK: - Output

protocol ContactDetailPresenterOutput: class {}

// MARK: - Protocol

protocol ContactDetailPresenter: class {
    var output: ContactDetailPresenterOutput? { get set }
    
    func handleViewIsReady()
}

// MARK: - Implementation

private final class ContactDetailPresenterImpl: ContactDetailPresenter, ContactDetailInteractorOutput {
    private let interactor: ContactDetailInteractor
    private let router: ContactDetailRouter
    weak var output: ContactDetailPresenterOutput?
    
    init(
        interactor: ContactDetailInteractor,
        router: ContactDetailRouter
        ) {
        self.interactor = interactor
        self.router = router
    }
    
    func handleViewIsReady() {
        
    }
}

// MARK: - Factory

final class ContactDetailPresenterFactory {
    static func `default`(
        interactor: ContactDetailInteractor = ContactDetailInteractorFactory.default(),
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
