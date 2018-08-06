//
//  NavigationRouter.swift
//  MyContacts
//
//  Created by Admin on 27.07.18.
//  Copyright © 2018 SlavaLeschenko. All rights reserved.
//

import UIKit

class NavigationRouter: NSObject {
    
    let navigationController: UINavigationController
    
    init(with navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
}
