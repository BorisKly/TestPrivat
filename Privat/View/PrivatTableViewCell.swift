//
//  PrivatTableViewCell.swift
//  Zell
//
//  Created by Boris Klykavka on 05.09.2022.
//

import UIKit

class PrivatTableViewCell: UITableViewCell {

    // MARK: - IBOutlet Properties

    @IBOutlet weak var currency: UILabel!

    @IBOutlet weak var rate: UILabel!

    // MARK: - Override Methods

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
