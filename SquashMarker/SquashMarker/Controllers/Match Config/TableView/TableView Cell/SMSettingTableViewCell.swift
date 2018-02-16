//
//  SMSettingTableViewCell.swift
//  SquashMarker
//
//  Created by Jamil Nawaz on 16/02/2018.
//  Copyright © 2018 Jamil Nawaz. All rights reserved.
//

import UIKit

enum SMSettingCellType {
    case playerDetails
    case bestOfGames
    case scoringSystem
    case scoringTo
}

class SMSettingTableViewCell: UITableViewCell {

    var cellSettingType: SMSettingCellType?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
