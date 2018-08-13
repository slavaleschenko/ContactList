//
//  ContactCell.swift
//  MyContacts
//
//  Created by Admin on 12.07.18.
//  Copyright © 2018 SlavaLeschenko. All rights reserved.
//

import UIKit

class ContactCell: UITableViewCell {

    @IBOutlet weak var contactName: UILabel!
    @IBOutlet weak var contactPhone: UILabel!
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }

}
