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
    
    init(_ scoringMethod: SMScoringMethod) {
        scoringStyle = scoringMethod
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
    }
    
    
    
}
