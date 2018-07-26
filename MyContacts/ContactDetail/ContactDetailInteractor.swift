//
//  ContactDetailInteractor.swift
//  MyContacts
//
//  Created by Admin on 26.07.18.
//  Copyright © 2018 SlavaLeschenko. All rights reserved.
//

import Foundation

// MARK: - Output

protocol ContactDetailInteractorOutput: class {}

// MARK: - Protocol

protocol ContactDetailInteractor: class {
    var output: ContactDetailInteractorOutput? { get set }
}

// MARK: - Implementation

private final class ContactDetailInteractorImpl: ContactDetailInteractor {
    weak var output: ContactDetailInteractorOutput?
}

// MARK: - Factory

final class ContactDetailInteractorFactory {
    static func `default`() -> ContactDetailInteractor {
        return ContactDetailInteractorImpl()
    }
}
