//
//  AppDelegateRouter.swift
//  MyContacts
//
//  Created by Admin on 27.07.18.
//  Copyright © 2018 SlavaLeschenko. All rights reserved.
//

import UIKit

// MARK: Protocol

protocol AppDelegateRouter {
    func routeToContactList()
}

// MARK: Implementation

private final class AppDelegateRouterImpl: AppDelegateRouter {
    
    private let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func routeToContactList() {
        let navigationController = UINavigationController()
        
        let router = ContactListRouterFactory.default(navigationController: navigationController)
        let presenter = ContactListPresenterFactory.default(router: router)
        let viewController = ContactListViewControllerFactory.new(presenter: presenter)
        
        navigationController.setViewControllers([viewController], animated: false)
        window.rootViewController = navigationController
    }
}

// MARK: Factory

final class AppDelegateRouterFactory {
    static func `default`(window: UIWindow) -> AppDelegateRouter {
        return AppDelegateRouterImpl(window: window)
    }
}
