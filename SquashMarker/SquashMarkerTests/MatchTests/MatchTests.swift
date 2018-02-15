//
//  MatchTests.swift
//  SquashMarkerTests
//
//  Created by Jamil Nawaz on 08/02/2018.
//  Copyright © 2018 Jamil Nawaz. All rights reserved.
//

import XCTest

class MatchTests: XCTestCase {
    
    let player1 = SMPlayer("Jimi")
    let player2 = SMPlayer("Jimi Opponent")
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testMatchSetup() {
        let match = SMMatch(player1, player2, .bestOf3)
        XCTAssertEqual(match.totalGames(), 3)
        
        let match1 = SMMatch(player1, player2)
        XCTAssertEqual(match1.totalGames(), 5)
    }
    
}