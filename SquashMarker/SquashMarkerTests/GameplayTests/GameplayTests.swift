//
//  GameplayTests.swift
//  SquashMarkerTests
//
//  Created by Jamil Nawaz on 08/02/2018.
//  Copyright © 2018 Jamil Nawaz. All rights reserved.
//

import XCTest

class GameplayTests: XCTestCase {
    
    let player1 = SMPlayer("Jimi")
    let player2 = SMPlayer("JimiOpponent")
    
    var match: SMMatch?
    var currentGame: SMGame?
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        match = SMMatch(player1, player2, .bestOf5, .english)
        currentGame = match?.gamesArray[0]
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    // English Scoring Tests
    func testHandout() {
        currentGame?.score = [0, 2]
        currentGame?.server = player1
        currentGame?.incrementScore(player2)
        
        //Server should switch
        XCTAssertEqual(currentGame?.server, player2)
        
        //Score should stay the same
        XCTAssertEqual((currentGame?.score!)!, [0, 2])
    }
    
    // American Scoring Tests
    func testAmericanHandout() {
        match = SMMatch(player1, player2, .bestOf5, .american)
        currentGame = match?.gamesArray[0]
        
        currentGame?.score = [0, 2]
        currentGame?.server = player1
        currentGame?.incrementScore(player2)
        
        //Server should switch
        XCTAssertEqual(currentGame?.server, player2)
        
        //Score should not stay the same
        XCTAssertEqual((currentGame?.score!)!, [0, 3])
    }
    
    func testGameWon() {
        match = SMMatch(player1, player2, .bestOf5, .american)
        currentGame = match?.gamesArray[0]
        
        currentGame?.score = [14, 2]
        currentGame?.server = player1
        currentGame?.incrementScore(player1)
        
        XCTAssertEqual((currentGame?.score)!, [15, 2])
    }
    
    func testMovedOnToTheNextGame() {
        match = SMMatch(player1, player2, .bestOf5, .american)
        currentGame = match?.currentGame
        
        currentGame?.score = [14, 2]
        currentGame?.server = player1
        currentGame?.incrementScore(player1)
        
        XCTAssertEqual((match?.currentGame?.score)!, [0, 0])
        
        /// Test Person who won the game is serving
        XCTAssertEqual(match?.currentGame?.server, player1)
    }

    /// Applicable only in american scoring
    func testTieBreakNextPointWins() {
        match = SMMatch(player1, player2, .bestOf5, .american)
        currentGame = match?.currentGame
        
        currentGame?.score = [14, 14]
        currentGame?.server = player1
        currentGame?.winBy = .oneClear
        currentGame?.tieBreak = true
        
        currentGame?.incrementScore(player1)
        XCTAssertEqual(match?.currentGame, match?.gamesArray[1])
    }
    
    /// Applicable only in american scoring
    func testTieBreakWinBy2Clear() {
        match = SMMatch(player1, player2, .bestOf5, .american)
        currentGame = match?.currentGame
        
        currentGame?.score = [14, 14]
        currentGame?.server = player1
        currentGame?.winBy = .twoClear
        currentGame?.tieBreak = true
        
        currentGame?.incrementScore(player1)
        XCTAssertEqual(match?.currentGame, match?.gamesArray[0])
        XCTAssertEqual((match?.currentGame?.score)!, [15, 14])
        
        currentGame?.incrementScore(player1)
        XCTAssertEqual(match?.currentGame, match?.gamesArray[1])
        XCTAssertEqual((match?.currentGame.score)!, [0, 0])
    }
    
    /// English scoring tie break one or three points
    func testTieBreakEnglishScoringNextPointWins() {
        match = SMMatch(player1, player2, .bestOf5, .english)
        currentGame = match?.currentGame
        
        currentGame?.score = [8, 8]
        currentGame?.tieBreak = true
        currentGame?.server = player1
        currentGame?.winBy = .oneClear
        
        currentGame?.incrementScore(player1)
        XCTAssertEqual(match?.currentGame, match?.gamesArray[1])
    }
    
    func testTieBreakEnglishScoringTo10() {
        match = SMMatch(player1, player2, .bestOf5, .english)
        currentGame = match?.currentGame
        
        currentGame?.score = [8, 8]
        currentGame?.tieBreak = true
        currentGame?.server = player1
        currentGame?.winBy = .twoClear
        
        currentGame?.incrementScore(player1)
        XCTAssertEqual(match?.currentGame, match?.gamesArray[0])
        XCTAssertEqual((match?.currentGame?.score)!, [9, 8])
        
        currentGame?.score = [9, 8]
        currentGame?.incrementScore(player1)
        XCTAssertEqual(match?.currentGame, match?.gamesArray[1])
    }

    
}
