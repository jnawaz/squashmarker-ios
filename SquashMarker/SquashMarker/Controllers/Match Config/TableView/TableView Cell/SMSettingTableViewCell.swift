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
    var isHomePlayer: Bool = false
    
    // MARK: - IBOutlets
    @IBOutlet weak var homeAwayLabel: UILabel!
    @IBOutlet weak var nameTextfield: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func configure() {
        
        defaultConfig()
        
        switch cellSettingType {
        case .playerDetails?:
            homeAwayLabel.text = (isHomePlayer) ? "Home Player" : "Away Player"
            
        case .bestOfGames?:
            hideNameInput()
            break
            
        case .scoringSystem?:
            hideNameInput()
            break
            
        case .scoringTo?:
            break
            
        default:
            break
        }
    }
    
    func hideNameInput() {
        nameTextfield.isHidden = false
    }
    
    func defaultConfig() {
        homeAwayLabel.isHidden = false
        nameTextfield.isHidden = false
    }
}
