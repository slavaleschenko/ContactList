//
//  ContactDetailRouter.swift
//  MyContacts
//
//  Created by Admin on 26.07.18.
//  Copyright © 2018 SlavaLeschenko. All rights reserved.
//

import Foundation
import UIKit

// MARK: - Protocol

protocol ContactDetailRouter {
    
}

// MARK: - Implementation

private final class ContactDetailRouterImpl: ContactDetailRouter {
    
}

// MARK: - Factory

final class ContactDetailRouterFactory {
    static func `default`() -> ContactDetailRouter {
        return ContactDetailRouterImpl()
    }
}
