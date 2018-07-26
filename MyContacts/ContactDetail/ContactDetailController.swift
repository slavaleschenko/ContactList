//
//  ContactDetailController.swift
//  MyContacts
//
//  Created by Admin on 26.07.18.
//  Copyright © 2018 SlavaLeschenko. All rights reserved.
//

import Foundation
import UIKit

// MARK: - Implementation

class ContactDetailController: UIViewController, ContactDetailPresenterOutput {
    fileprivate let presenter: ContactDetailPresenter
    
    init(presenter: ContactDetailPresenter) {
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

final class ContactDetailControllerFactory {
    static func new(
        presenter: ContactDetailPresenter
        ) -> ContactDetailController {
        let controller = ContactDetailController(presenter: presenter)
        presenter.output = controller
        return controller
    }
}
