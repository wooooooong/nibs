//
//  NewOrderListTableViewCell.swift
//  nibs_store
//
//  Created by mac on 2018. 4. 28..
//  Copyright © 2018년 nibs. All rights reserved.
//

import UIKit

class NewOrderListTableViewCell: UITableViewCell {
    @IBOutlet weak var seatNoLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    var orderHash: String = ""
    @IBAction func tabOrderCompletBtn(_ sender: Any) {
        NotificationCenter.default.post(name: NSNotification.Name("orderCheck"), object: self, userInfo: ["order" : nameLabel.text!, "orderHash": orderHash])
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
