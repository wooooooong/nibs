//
//  MenuPhotoTableViewCell.swift
//  nibs
//
//  Created by Tedigom on 2018. 4. 28..
//  Copyright © 2018년 nibs. All rights reserved.
//

import UIKit

class MenuPhotoTableViewCell: UITableViewCell {

    
    @IBOutlet weak var menuTitle: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var cellImageView: UIImageView!
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var countStepper: UIStepper!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
