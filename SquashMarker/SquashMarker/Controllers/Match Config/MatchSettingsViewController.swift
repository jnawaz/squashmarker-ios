//
//  MatchSettingsViewController.swift
//  SquashMarker
//
//  Created by Jamil Nawaz on 16/02/2018.
//  Copyright © 2018 Jamil Nawaz. All rights reserved.
//

import UIKit

class MatchSettingsViewController: UIViewController {
    
    @IBOutlet weak var matchSetupTable: UITableView!
    var dataSource: SMTableViewDatasource!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        roundTableCorners()
        
        var tableArray = [SMCellData]()
        
        let player1 = SMCellData(cellType: .playerDetails)
        tableArray.append(player1)
        
        let player2 = SMCellData(cellType: .playerDetails)
        tableArray.append(player2)
        
        let bestOfGames = SMCellData(cellType: .bestOfGames)
        tableArray.append(bestOfGames)
        
        let scoringSystem = SMCellData(cellType: .scoringSystem)
        tableArray.append(scoringSystem)
        
        let scoringTo = SMCellData(cellType: .scoringTo)
        tableArray.append(scoringTo)
        
        dataSource = SMTableViewDatasource(data: tableArray)
        matchSetupTable.dataSource = dataSource
        
        let tableDelegate = SMTableViewDelegate()
        matchSetupTable.delegate = tableDelegate
        
        print("check ")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func dismissController(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: Table Visuals
    func roundTableCorners() {
        matchSetupTable.layer.cornerRadius = 8
    }
    
}
