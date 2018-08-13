//
//  AddContactController.swift
//  MyContacts
//
//  Created by Admin on 26.07.18.
//  Copyright © 2018 SlavaLeschenko. All rights reserved.
//

import Foundation
import UIKit
import Contacts

// MARK: - Implementation

class AddContactController: UIViewController, AddContactPresenterOutput {
  
    
    @IBOutlet weak var firstNameTxt: UITextField!
    @IBOutlet weak var lastNameTxt: UITextField!
    @IBOutlet weak var emailTxt: UITextField!
    
    @IBOutlet weak var bdayDatePicker: UIDatePicker!
    
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
        configureNavigationBar()
    }
    
    func contactDidUpdate() {
        navigationController?.popViewController(animated: true)
        
    }
    @objc func saveButtonDidTap() {
        firstNameTxt.resignFirstResponder()
        lastNameTxt.resignFirstResponder()
        
        presenter.handleSave()
    }
    
    private func configureNavigationBar() {
        self.title = "Add Contact"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveButtonDidTap))
    }
}

// MARK: - UITextFieldDelegate extension

extension AddContactController: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        switch textField {
        case firstNameTxt:
            presenter.handle(firstName: textField.text ?? "")
        case lastNameTxt:
            presenter.handle(lastName: textField.text ?? "")
        default: break
        }
        
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
