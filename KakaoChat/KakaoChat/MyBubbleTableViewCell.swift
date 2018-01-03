//
//  MyBubbleTableViewCell.swift
//  KakaoChat
//
//  Created by Park GilNam on 2018. 1. 3..
//  Copyright © 2018년 ParkGilNam. All rights reserved.
//

import UIKit

class MyBubbleTableViewCell: UITableViewCell {

    @IBOutlet weak var bubbleTextLabel: UILabel!
    @IBOutlet weak var timeTextLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
