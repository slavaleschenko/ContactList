//
//  ContactServices.swift
//  MyContacts
//
//  Created by Admin on 09.08.18.
//  Copyright © 2018 SlavaLeschenko. All rights reserved.
//

import Foundation
import ContactsUI


protocol ContactServices {
    func saveContact(contact: CNMutableContact)
    func fetchAllContacts()
}

// MARK: Implementation

private final class ContactServicesImpl: ContactServices {
    
    func saveContact(contact: CNMutableContact) {
        do {
            let store = CNContactStore()
            let saveRequest = CNSaveRequest()
            saveRequest.add(contact, toContainerWithIdentifier: nil)
            try store.execute(saveRequest)
            
        } catch {
            print(error)
        }
    }
    
    func fetchAllContacts() {
        
        return
    }
}

// MARK: Factory

final class ContactServicesFactory {
    static func `default`() -> ContactServices {
        return ContactServicesImpl()
    }
}
