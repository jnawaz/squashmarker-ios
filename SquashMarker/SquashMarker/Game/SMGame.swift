//
//  SMGame.swift
//  SquashMarker
//
//  Created by Jamil Nawaz on 08/02/2018.
//  Copyright © 2018 Jamil Nawaz. All rights reserved.
//

import UIKit



class SMGame: NSObject {
    
    var server: SMPlayer?
    var score: [Int]?
    var scoringStyle: SMScoringMethod!
    
    var matchDelegate: SMMatchProtocol
    
    init(_ scoringMethod: SMScoringMethod, matchProtocol: SMMatchProtocol) {
        scoringStyle = scoringMethod
        matchDelegate = matchProtocol
        score = [0, 0]
    }
    
    /// incrementScore handles the incrementing of scores
    /// this method handles the english and american scoring
    /// - Parameter scorer: The player that scored
    func incrementScore(_ scorer: SMPlayer) {
        // English Scoring
        if scoringStyle == .English {
            if scorer == server {
                wonPoint(scorer)
            } else {
                // Switch Server, scores remain the same
                server = scorer
            }
        } else {
            // American Scoring, scorer scores the point
            wonPoint(scorer)
            server = scorer
        }
    }
    
    
    /// This method increments the players score
    ///
    /// - Parameter player: The player whose scores should be incremented
    func wonPoint(_ player: SMPlayer) {
        if player.isHomePlayer! {
            score![0] = score![0] + 1
        } else {
            score![1] = score![1] + 1
        }
        
        checkGameFinish(player)
    }
    
    func checkGameFinish(_ player: SMPlayer) {
        switch scoringStyle {
        case .English:
            if score![0] == 9 || score![1] == 9 {
                matchDelegate.progressToNextGame(player)
                break
            }
        default:
            let scoring = matchDelegate.getScoringTo()
            // American Scoring
            switch scoring {
            case .eleven:
                if score![0] == 11 || score![1] == 11 {
                    matchDelegate.progressToNextGame(player)
                }
                break
            case .fifteen:
                if score![0] == 15 || score![1] == 15 {
                    matchDelegate.progressToNextGame(player)
                }
                break
            default:
                break
            }
        }
    }
}
