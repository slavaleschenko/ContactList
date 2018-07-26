//
//  AddContactPresenter.swift
//  MyContacts
//
//  Created by Admin on 26.07.18.
//  Copyright © 2018 SlavaLeschenko. All rights reserved.
//

import Foundation
// MARK: - Output

protocol AddContactPresenterOutput: class {}

// MARK: - Protocol

protocol AddContactPresenter: class {
    var output: AddContactPresenterOutput? { get set }
    
    func handleViewIsReady()
}

// MARK: - Implementation

private final class AddContactPresenterImpl: AddContactPresenter, AddContactInteractorOutput {
    private let interactor: AddContactInteractor
    private let router: AddContactRouter
    weak var output: AddContactPresenterOutput?
    
    init(
        interactor: AddContactInteractor,
        router: AddContactRouter
        ) {
        self.interactor = interactor
        self.router = router
    }
    
    func handleViewIsReady() {
        
    }
}

// MARK: - Factory

final class AddContactPresenterFactory {
    static func `default`(
        interactor: AddContactInteractor = AddContactInteractorFactory.default(),
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
