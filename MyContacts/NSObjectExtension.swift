//
//  NSObjectExtension.swift
//  MyContacts
//
//  Created by Admin on 27.07.18.
//  Copyright © 2018 SlavaLeschenko. All rights reserved.
//

import Foundation

extension NSObject {
    static var className: String {
        return String(describing: self)
    }
    
    var className: String {
        return String(describing: self)
    }
}
