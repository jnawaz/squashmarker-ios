//
//  SMTableViewDelegate.swift
//  SquashMarker
//
//  Created by Jamil Nawaz on 16/02/2018.
//  Copyright © 2018 Jamil Nawaz. All rights reserved.
//

import UIKit

fileprivate let headerHeight = 100.0

class SMTableViewDelegate: NSObject, UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("selected cell")
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = SettingsHeader(
            frame: CGRect(
                x: 0.0,
                y: 0.0,
                width: Double(tableView.frame.size.width),
                height: headerHeight
                
            )
        )
        header.backgroundColor = SMColors.harvardCrimson()
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat(headerHeight)
    }
}
