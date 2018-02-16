//
//  DataSourceTableViewStub.swift
//  SquashMarker
//
//  Created by Jamil Nawaz on 16/02/2018.
//  Copyright © 2018 Jamil Nawaz. All rights reserved.
//

import UIKit

class DataSourceTableViewStub<Cell: UITableViewCell>: UITableView {
    override func dequeueReusableCell(withIdentifier identifier: String, for indexPath: IndexPath) -> UITableViewCell {
        return Cell()
    }
}
