//
//  SMMatch.swift
//  SquashMarker
//
//  Created by Jamil Nawaz on 08/02/2018.
//  Copyright © 2018 Jamil Nawaz. All rights reserved.
//

import UIKit

enum SMBestOf {
    case bestOf3
    case bestOf5
}

enum SMScoringMethod {
    case English
    case American
}

class SMMatch: NSObject {
    
    let bestOf: SMBestOf
    let gamesArray: [SMGame]
    let scoringMethod: SMScoringMethod?
    
    let home: SMPlayer
    let away: SMPlayer
    
    init(_ homePlayer: SMPlayer, _ awayPlayer: SMPlayer, _ totalGames: SMBestOf? = .bestOf5, _ scoringStyle: SMScoringMethod? = .English) {
        
        home = homePlayer
        away = awayPlayer
        
        scoringMethod = scoringStyle
        
        bestOf = totalGames!
        switch bestOf {
        case .bestOf3:
            gamesArray = [SMGame(), SMGame(), SMGame()]
        default:
            gamesArray = [SMGame(), SMGame(), SMGame(), SMGame(), SMGame()]
        }
    }
    
    func totalGames() -> Int {
        return gamesArray.count
    }
}
