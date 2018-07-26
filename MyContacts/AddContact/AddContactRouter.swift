//
//  AddContactRouter.swift
//  MyContacts
//
//  Created by Admin on 26.07.18.
//  Copyright © 2018 SlavaLeschenko. All rights reserved.
//

import Foundation
import UIKit

// MARK: - Protocol

protocol AddContactRouter {
    
}

// MARK: - Implementation

private final class AddContactRouterImpl: AddContactRouter {
    
}

// MARK: - Factory

final class AddContactRouterFactory {
    static func `default`() -> AddContactRouter {
        return AddContactRouterImpl()
    }
}
