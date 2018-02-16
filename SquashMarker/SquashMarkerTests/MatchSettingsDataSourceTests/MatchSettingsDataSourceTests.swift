//
//  MatchSettingsDataSourceTests.swift
//  SquashMarkerTests
//
//  Created by Jamil Nawaz on 16/02/2018.
//  Copyright © 2018 Jamil Nawaz. All rights reserved.
//

import XCTest

class MatchSettingsDataSourceTests: XCTestCase {
    
    var tableViewStub = DataSourceTableViewStub<SMSettingTableViewCell>()
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testNumberOfSections() {
        let sut = SMTableViewDatasource(data: settingsData)
        XCTAssertEqual(sut.numberOfSections(in: tableViewStub), 1)
    }
    
    func testNumberOfRowsInSection() {
        let sut = SMTableViewDatasource(data: settingsData)
        XCTAssertEqual(sut.tableView(tableViewStub, numberOfRowsInSection: 0), settingsData.count)
    }
    
    var settingsData: [SMCellData] {
        return [
            SMCellData(cellType: .playerDetails),
            SMCellData(cellType: .playerDetails)
        ]
    }
    
}
