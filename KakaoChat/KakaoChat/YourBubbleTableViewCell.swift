//
//  YourBubbleTableViewCell.swift
//  KakaoChat
//
//  Created by Park GilNam on 2018. 1. 3..
//  Copyright © 2018년 ParkGilNam. All rights reserved.
//

import UIKit

class YourBubbleTableViewCell: UITableViewCell {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var bubbleTextLabel: UILabel!
    @IBOutlet weak var timeTextLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        profileImage.layer.cornerRadius = 30 / 2
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
