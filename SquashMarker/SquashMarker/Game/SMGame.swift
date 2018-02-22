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
    var winBy: SMTieBreakTo?
    var tieBreak: Bool = false
    weak var matchDelegate: SMMatchProtocol?
    
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
        if scoringStyle == .english {
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
    
    /// Method checks if a game is finished by checking the score based on scoring type English or American, takes into account tie breaks
    /// and then progresses the match to the next game.
    /// - Parameter player: The player who most recently scored a point.
    func checkGameFinish(_ player: SMPlayer) {
        switch scoringStyle {
        case .english:
            checkEnglishScoringGameFinished(player)
        default:
            checkAmericanScoringGameFinished(player)
        }
    }
    
    /// Method works out if a player is two clear or next point wins
    ///
    /// - Parameter player: The player who scored the point
    func workoutTieBreakScores(_ player: SMPlayer) {
        switch winBy {
        case .twoClear?:
            if twoClear() {
                matchDelegate?.progressToNextGame(player)
            }
        case .oneClear?:
            if oneClear() {
                matchDelegate?.progressToNextGame(player)
            }
        default:
            break
        }
    }
    
    /// Method works out if a players score is two points clear of the other player
    ///
    /// - Returns: true or false
    func twoClear() -> Bool {
        return score![0] - score![1] == 2 || score![1] - score![0] == 2
    }
    
    /// Methods works out if score is one ahead of the other
    /// Useful in next point wins
    /// - Returns: true or false
    func oneClear() -> Bool {
        return score![0] - score![1] == 1 || score![1] - score![0] == 1
    }
    
    /// Works out if an english socring game is over
    ///
    /// - Parameter player: Player that scored the point
    func checkEnglishScoringGameFinished(_ player: SMPlayer) {
        if score![0] == 8 && score![1] == 8 {
            tieBreak = true
        } else if tieBreak {
            switch winBy {
            case .oneClear?:
                if score![0] == 9 || score![1] == 9 {
                    matchDelegate?.progressToNextGame(player)
                }
            case .twoClear?:
                if score![0] == 10 || score![1] == 10 {
                    matchDelegate?.progressToNextGame(player)
                }
            default:
                break
            }
        } else {
            if score![0] == 9 || score![1] == 9 {
                matchDelegate?.progressToNextGame(player)
            }
        }
    }
    
    /// Works out if an amercian socring game is over
    ///
    /// - Parameter player: Player that scored the point
    func checkAmericanScoringGameFinished(_ player: SMPlayer) {
        let scoring = matchDelegate?.getScoringTo()
        // American Scoring
        switch scoring {
        case .eleven?:
            if score![0] == 10 && score![1] == 10 {
                tieBreak = true
            } else if tieBreak {
                workoutTieBreakScores(player)
            } else {
                if score![0] == 11 || score![1] == 11 {
                    matchDelegate?.progressToNextGame(player)
                }
            }
        case .fifteen?:
            if score![0] == 14 && score![1] == 14 {
                tieBreak = true
            } else if tieBreak {
                workoutTieBreakScores(player)
            } else {
                if score![0] == 15 || score![1] == 15 {
                    matchDelegate?.progressToNextGame(player)
                }
            }
        default:
            break
        }
    }
}
