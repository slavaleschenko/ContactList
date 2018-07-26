//
//  ContactListInteractor.swift
//  MyContacts
//
//  Created by Admin on 26.07.18.
//  Copyright © 2018 SlavaLeschenko. All rights reserved.
//

import Foundation

// MARK: - Output

protocol ContactListInteractorOutput: class {}

// MARK: - Protocol

protocol ContactListInteractor: class {
    var output: ContactListInteractorOutput? { get set }
}

// MARK: - Implementation

private final class ContactListInteractorImpl: ContactListInteractor {
    weak var output: ContactListInteractorOutput?
}

// MARK: - Factory

final class ContactListInteractorFactory {
    static func `default`() -> ContactListInteractor {
        return ContactListInteractorImpl()
    }
}
