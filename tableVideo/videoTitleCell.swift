//
//  videoTitleCell.swift
//  tableVideo
//
//  Created by Sandeep Joshi on 12/4/18.
//  Copyright © 2018 Sandeep Joshi. All rights reserved.
//

import UIKit

class videoTitleCell: UITableViewCell {

    @IBOutlet weak var info1: UILabel!
    @IBOutlet weak var info2: UILabel!
    @IBOutlet weak var thumbnail: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.info1.text = "Info 1"
        self.info2.text = "Info 2"
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
