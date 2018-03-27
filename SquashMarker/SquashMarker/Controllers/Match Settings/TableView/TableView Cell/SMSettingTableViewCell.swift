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

protocol SMTableViewReloader {
    func refreshTable()
    func updateScoringToCell(switcher: UISwitch)
}

class SMSettingTableViewCell: UITableViewCell {

    var cellSettingType: SMSettingCellType?
    var isHomePlayer: Bool = false
    
    // MARK: - Delegates
    var refreshDelegate: SMTableViewReloader!
    
    // MARK: - IBOutlets
    @IBOutlet weak var homeAwayLabel: UILabel!
    @IBOutlet weak var nameTextfield: UITextField!
    @IBOutlet weak var leftConfigLabel: UILabel!
    @IBOutlet weak var rightConfigLabel: UILabel!
    @IBOutlet weak var scoringStyleSwitcher: UISwitch!
    @IBOutlet weak var scoringToSwitcher: UISwitch!
    
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
            hideSwitch()
            
        case .bestOfGames?:
            homeAwayLabel.text = "Best of..."
            hideNameInput()
            hideSwitch()
            
        case .scoringSystem?:
            homeAwayLabel.text = "Scoring Style..."
            hideNameInput()
            scoringStyleSwitcher.isHidden = false
            leftConfigLabel.text = "American / P.P.R"
            rightConfigLabel.text = "English"
            
        case .scoringTo?:
            homeAwayLabel.text = "Scoring To..."
            hideNameInput()
            scoringToSwitcher.isHidden = false
            if scoringStyleSwitcher.isOn {
                // American Scoring
                leftConfigLabel.text = ""
                rightConfigLabel.text = "9"
                scoringToSwitcher.isEnabled = false
            } else {
                // English Scoring
                leftConfigLabel.text = "11"
                rightConfigLabel.text = "15"
            }
            
        default:
            break
        }
    }
    
    func hideNameInput() {
        nameTextfield.isHidden = true
    }
    
    func hideSwitch() {
        scoringToSwitcher.isHidden = true
        scoringStyleSwitcher.isHidden = true
    }
    
    func defaultConfig() {
        homeAwayLabel.isHidden = false
        nameTextfield.isHidden = false
        leftConfigLabel.text = ""
        rightConfigLabel.text = ""
        scoringStyleSwitcher.isHidden = true
        scoringToSwitcher.isHidden = true
    }
    
    @IBAction func switchChanged(sender: UISwitch) {
        refreshDelegate.updateScoringToCell(switcher: sender)
    }
}
