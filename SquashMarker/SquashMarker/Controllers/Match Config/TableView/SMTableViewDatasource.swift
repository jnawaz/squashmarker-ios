//
//  SMTableViewDatasource.swift
//  SquashMarker
//
//  Created by Jamil Nawaz on 16/02/2018.
//  Copyright © 2018 Jamil Nawaz. All rights reserved.
//

import UIKit

class SMTableViewDatasource: NSObject, UITableViewDataSource {
    
    let reuseIdentifier = "matchSettingsCell"
    
    let dataArray: Array<Any>
    
    init(data: Array<Any>) {
        dataArray = data
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier) as! SMSettingTableViewCell
        
        return cell
    }
    
    
    
    
}
