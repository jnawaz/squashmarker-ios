//
//  SMMatchProtocol.swift
//  SquashMarker
//
//  Created by Jamil Nawaz on 09/02/2018.
//  Copyright © 2018 Jamil Nawaz. All rights reserved.
//

import UIKit

protocol SMMatchProtocol: class {
    func progressToNextGame(_ server: SMPlayer!)
    func getScoringTo() -> SMScoringTo
}
