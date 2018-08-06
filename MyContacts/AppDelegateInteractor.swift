//
//  AppDelegateInteractor.swift
//  MyContacts
//
//  Created by Admin on 27.07.18.
//  Copyright © 2018 SlavaLeschenko. All rights reserved.
//

import Foundation

// MARK: Protocol

protocol AppDelegateInteractor {
    
}

// MARK: Implementation

private final class AppDelegateInteractorImpl: AppDelegateInteractor {
    
}

// MARK: Factory

final class AppDelegateInteractorFactory {
    static func `default`() -> AppDelegateInteractor {
        return AppDelegateInteractorImpl()
    }
}
