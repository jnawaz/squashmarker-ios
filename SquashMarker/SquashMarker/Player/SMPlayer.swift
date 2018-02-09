//
//  SMPlayer.swift
//  SquashMarker
//
//  Created by Jamil Nawaz on 08/02/2018.
//  Copyright © 2018 Jamil Nawaz. All rights reserved.
//

import UIKit

class SMPlayer: NSObject {

    var name: String
    var isHomePlayer: Bool?
    
    init(_ playerName: String) {
        name = playerName
    }
}
