//
//  AddContactController.swift
//  MyContacts
//
//  Created by Admin on 26.07.18.
//  Copyright © 2018 SlavaLeschenko. All rights reserved.
//

import Foundation
import UIKit

// MARK: - Implementation

class AddContactController: UIViewController, AddContactPresenterOutput {
    fileprivate let presenter: AddContactPresenter
    
    init(presenter: AddContactPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.handleViewIsReady()
    }
}

// MARK: - Factory

final class AddContactControllerFactory {
    static func new(
        presenter: AddContactPresenter
        ) -> AddContactController {
        let controller = AddContactController(presenter: presenter)
        presenter.output = controller
        return controller
    }
}
