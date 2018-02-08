//
//  SMGame.swift
//  SquashMarker
//
//  Created by Jamil Nawaz on 08/02/2018.
//  Copyright © 2018 Jamil Nawaz. All rights reserved.
//

import UIKit

class SMGame: NSObject {
    
    let home: SMPlayer
    let away: SMPlayer
    
    init(_ homePlayer: SMPlayer, _ awayPlayer: SMPlayer) {
        home = homePlayer
        away = awayPlayer
    }
}
