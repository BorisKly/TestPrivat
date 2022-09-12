//
//  PrivatTableViewCell.swift
//  Zell
//
//  Created by Boris Klykavka on 05.09.2022.
//

import UIKit

class PrivatTableViewCell: UITableViewCell {

    @IBOutlet weak var currency: UILabel!

    @IBOutlet weak var rate: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
