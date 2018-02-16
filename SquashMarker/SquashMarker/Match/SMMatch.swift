//
//  SMMatch.swift
//  SquashMarker
//
//  Created by Jamil Nawaz on 08/02/2018.
//  Copyright © 2018 Jamil Nawaz. All rights reserved.
//

import UIKit

class SMMatch: NSObject, SMMatchProtocol {
    
    var bestOf: SMBestOf!
    var gamesArray: [SMGame]!
    var currentGame: SMGame!
    var currentGameIndex: Int = 0
    var scoringMethod: SMScoringMethod?
    var scoringTo: SMScoringTo?
    
    var home: SMPlayer!
    var homeGameCount = 0
    
    var away: SMPlayer!
    var awayGameCount = 0
    
    /// Match initialisation method taking two players
    /// by default the first parameter is the home team player
    /// - Parameters:
    ///   - homePlayer: The home team player
    ///   - awayPlayer: The away team player
    ///   - totalGames: Best of 5 (default) or Best of 3
    ///   - scoringStyle: English Method (default) or American
    ///   - ppg: Points per game
    init(_ homePlayer: SMPlayer, _ awayPlayer: SMPlayer, _ totalGames: SMBestOf? = .bestOf5, _ scoringStyle: SMScoringMethod? = .English, ppg: SMScoringTo? = .fifteen) {
        
        super.init()
        
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
                SMGame(scoringMethod!, matchProtocol: self),
                SMGame(scoringMethod!, matchProtocol: self),
                SMGame(scoringMethod!, matchProtocol: self)
            ]
        default:
            gamesArray = [
                SMGame(scoringMethod!, matchProtocol: self),
                SMGame(scoringMethod!, matchProtocol: self),
                SMGame(scoringMethod!, matchProtocol: self),
                SMGame(scoringMethod!, matchProtocol: self),
                SMGame(scoringMethod!, matchProtocol: self)
            ]
        }
        
        //default current game to the first one
        currentGame = gamesArray[currentGameIndex]
    }
    
    
    /// Returns the total number of games in a match
    /// 5 for best of 5 and 3 for best of 3
    /// - Returns: Total number of games in a match
    func totalGames() -> Int {
        return gamesArray.count
    }
    
    
    
    /// Utility method to progress to the next game
    ///
    /// - Parameter server: The player that won the game and will begin the next game by serving
    func progressToNextGame(_ server: SMPlayer!) {
        
        currentGameIndex += 1
        currentGame = gamesArray[currentGameIndex]
        currentGame.server = server
        
        if (server?.isHomePlayer)! {
            homeGameCount += 1
        } else {
            awayGameCount += 1
        }
        
        let winner = checkMatchWon()
        if winner != nil {
            
        }
        
    }
    
    
    /// Scoring to 11 (English scoring), 11 or 15 if American scoring
    ///
    /// - Returns: Enum denoting max points a game is played to.
    func getScoringTo() -> SMScoringTo {
        return scoringTo!
    }
    
    
    /// Determines who won the match
    ///
    /// - Returns: Return the player who won the match
    func checkMatchWon() -> SMPlayer? {
        
        var playerWon: SMPlayer? = nil
        
        switch bestOf {
        case .bestOf3:
            if homeGameCount == 2 {
                playerWon = home
            } else if awayGameCount == 2 {
                playerWon = away
            }
            break
        default:
            if homeGameCount == 3 {
                playerWon = home
            } else if awayGameCount == 3 {
                playerWon = away
            }
            break
        }
        
        return playerWon
    }
}
