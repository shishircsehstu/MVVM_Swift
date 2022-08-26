//
//  UserTableViewCell.swift
//  MVVMDemo
//
//  Created by Saddam on 22/8/22.
//

import UIKit

class UserTableViewCell: UITableViewCell {

    @IBOutlet var name: UILabel!
    @IBOutlet var email: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
