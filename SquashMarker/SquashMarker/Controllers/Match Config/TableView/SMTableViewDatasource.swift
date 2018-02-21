//
//  SMTableViewDatasource.swift
//  SquashMarker
//
//  Created by Jamil Nawaz on 16/02/2018.
//  Copyright © 2018 Jamil Nawaz. All rights reserved.
//

import UIKit

fileprivate let reuseIdentifier = "matchSettingsCell"

class SMTableViewDatasource: NSObject, UITableViewDataSource {
    
    let dataArray: [SMCellData]
    
    init(data: [SMCellData]) {
        dataArray = data
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier) as? SMSettingTableViewCell
        cell?.selectionStyle = .none
        return cell!
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
}
