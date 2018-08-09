//
//  AddContactInteractor.swift
//  MyContacts
//
//  Created by Admin on 26.07.18.
//  Copyright © 2018 SlavaLeschenko. All rights reserved.
//

import Foundation


// MARK: - Output

protocol AddContactInteractorOutput: class {}

// MARK: - Protocol

protocol AddContactInteractor: class {
    var output: AddContactInteractorOutput? { get set }
}

// MARK: - Implementation

private final class AddContactInteractorImpl: AddContactInteractor {
    weak var output: AddContactInteractorOutput?
}

// MARK: - Factory

final class AddContactInteractorFactory {
    static func `default`() -> AddContactInteractor {
        return AddContactInteractorImpl()
    }
    
}
