//
//  ContactListRouter.swift
//  MyContacts
//
//  Created by Admin on 26.07.18.
//  Copyright © 2018 SlavaLeschenko. All rights reserved.
//

import Foundation
import UIKit

// MARK: - Protocol

protocol ContactListRouter {
    
}

// MARK: - Implementation

private final class ContactListRouterImpl: ContactListRouter {
    
}

// MARK: - Factory

final class ContactListRouterFactory {
    static func `default`() -> ContactListRouter {
        return ContactListRouterImpl()
    }
}
