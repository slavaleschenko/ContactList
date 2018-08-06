//
//  TableViewCellExtension.swift
//  MyContacts
//
//  Created by Admin on 27.07.18.
//  Copyright © 2018 SlavaLeschenko. All rights reserved.
//

import UIKit

extension UITableViewCell {
    func getDataFromUrl(url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            completion(data, response, error)
            }.resume()
    }
    
    static func nib() -> UINib {
        return UINib(nibName: self.className, bundle: nil)
    }
    
    static func reuseIdentifier() -> String {
        return className
    }
}
