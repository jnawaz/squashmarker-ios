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

enum SMScoringTo {
    case nine
    case eleven
    case fifteen
}

class SMMatch: NSObject {
    
    let bestOf: SMBestOf
    let gamesArray: [SMGame]
    let scoringMethod: SMScoringMethod?
    let scoringTo: SMScoringTo?
    
    let home: SMPlayer
    let away: SMPlayer
    
    
    /// Match initialisation method taking two players
    /// by default the first parameter is the home team player
    /// - Parameters:
    ///   - homePlayer: The home team player
    ///   - awayPlayer: The away team player
    ///   - totalGames: Best of 5 (default) or Best of 3
    ///   - scoringStyle: English Method (default) or American
    ///   - ppg: Points per game
    init(_ homePlayer: SMPlayer, _ awayPlayer: SMPlayer, _ totalGames: SMBestOf? = .bestOf5, _ scoringStyle: SMScoringMethod? = .English, ppg: SMScoringTo? = .fifteen) {
        
        home = homePlayer
        homePlayer.isHomePlayer = true
        away = awayPlayer
        awayPlayer.isHomePlayer = false
        
        scoringMethod = scoringStyle
        
        if scoringMethod == .English {
            scoringTo = .nine
        } else {
            scoringTo = ppg
        }
        
        bestOf = totalGames!
        switch bestOf {
        case .bestOf3:
            gamesArray = [
                SMGame(scoringMethod!),
                SMGame(scoringMethod!),
                SMGame(scoringMethod!)
            ]
        default:
            gamesArray = [
                SMGame(scoringMethod!),
                SMGame(scoringMethod!),
                SMGame(scoringMethod!),
                SMGame(scoringMethod!),
                SMGame(scoringMethod!)
            ]
        }
    }
    
    func totalGames() -> Int {
        return gamesArray.count
    }
}
