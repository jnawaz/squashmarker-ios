//
//  SMGame.swift
//  SquashMarker
//
//  Created by Jamil Nawaz on 08/02/2018.
//  Copyright © 2018 Jamil Nawaz. All rights reserved.
//

import UIKit

enum SMScoringMethod {
    case English
    case American
}

class SMGame: NSObject {
    
    let home: SMPlayer
    let away: SMPlayer
    
    let scoringMethod: SMScoringMethod?
    
    init(_ homePlayer: SMPlayer, _ awayPlayer: SMPlayer, _ scoringStyle: SMScoringMethod? = .English) {
        home = homePlayer
        away = awayPlayer
        
        scoringMethod = scoringStyle
    }
}
