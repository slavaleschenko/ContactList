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
    
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        // Initialization code
//    }
//
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }

}
