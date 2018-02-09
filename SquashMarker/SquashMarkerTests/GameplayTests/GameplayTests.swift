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
        match = SMMatch(player1, player2, .bestOf5, .English)
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
        match = SMMatch(player1, player2, .bestOf5, .American)
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
        match = SMMatch(player1, player2, .bestOf5, .American)
        currentGame = match?.gamesArray[0]
        
        currentGame?.score = [14, 2]
        currentGame?.server = player1
        currentGame?.incrementScore(player1)
        
        XCTAssertEqual((currentGame?.score)!, [15, 2])
    }
    
}
