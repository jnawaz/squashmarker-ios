//
//  GameTests.swift
//  SquashMarkerTests
//
//  Created by Jamil Nawaz on 08/02/2018.
//  Copyright © 2018 Jamil Nawaz. All rights reserved.
//

import XCTest

class GameTests: XCTestCase {
    
    let player1 = SMPlayer()
    let player2 = SMPlayer()
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testGameHasTwoPlayers() {
        let newGame = SMGame(player1, player2)
        XCTAssertNotNil(newGame, "New Game not initialised")
    }
    
    func testScoringMethod() {
        let newGame = SMGame(player1, player2)
        XCTAssert(newGame.scoringMethod == .English)
        
        let newGame1 = SMGame(player1, player2, .American)
        XCTAssert(newGame1.scoringMethod == .American)
    }
    
}
