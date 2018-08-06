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
    func addContactRouter() -> AddContactRouter
    func routeToAddContact(presenter: AddContactPresenter)
    
}

// MARK: - Implementation

private final class ContactListRouterImpl: NavigationRouter, ContactListRouter {
    func routeToAddContact(presenter: AddContactPresenter) {
        let controller = AddContactControllerFactory.new(presenter: presenter)
        navigationController.pushViewController(controller, animated: true)
    }
    
    func addContactRouter() -> AddContactRouter {
        return AddContactRouterFactory.default(navigationController: navigationController)
    }
    
    
}

// MARK: - Factory

final class ContactListRouterFactory {
    static func `default`(
        navigationController: UINavigationController
        ) -> ContactListRouter {
        return ContactListRouterImpl(
            with: navigationController
        )
    }
}
