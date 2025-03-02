//
//  PersonTableViewCell.swift
//  ContactsApp
//
//  Created by Burak Aydın on 6.03.2024.
//

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet weak var personNameLabel: UILabel!
    @IBOutlet weak var personPhoneLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
     
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }

}
