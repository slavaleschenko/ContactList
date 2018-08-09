//
//  ContactDetailInteractor.swift
//  MyContacts
//
//  Created by Admin on 26.07.18.
//  Copyright © 2018 SlavaLeschenko. All rights reserved.
//

import Foundation
import Contacts

// MARK: - Output

protocol ContactDetailInteractorOutput: class {}

// MARK: - Protocol

protocol ContactDetailInteractor: class {
    var output: ContactDetailInteractorOutput? { get set }
    
    func tappedContact(completion: @escaping (_ result: [CNContact]) -> Void)
}

// MARK: - Implementation

private final class ContactDetailInteractorImpl: ContactDetailInteractor {
    weak var output: ContactDetailInteractorOutput?
    
    let contact: CNContact
    
    init(contact: CNContact) {
        self.contact = contact
    }
    
    func tappedContact(completion: @escaping (_ result: [CNContact]) -> Void) {
            var results = [CNContact]()
            let keys = [CNContactGivenNameKey,CNContactFamilyNameKey,CNContactMiddleNameKey,CNContactEmailAddressesKey,CNContactPhoneNumbersKey] as [CNKeyDescriptor]
            let store = CNContactStore()
                    do {
                        try store.unifiedContacts(matching: CNContact.predicateForContacts(matchingName: self.contact.familyName), keysToFetch: keys)
                        
                    }
                    catch let error {
                        print(error.localizedDescription)
                    }
        completion(results)
        
    }
}

// MARK: - Factory

final class ContactDetailInteractorFactory {
    static func `default`(contact: CNContact) -> ContactDetailInteractor {
        return ContactDetailInteractorImpl(contact: contact)
    }
}
