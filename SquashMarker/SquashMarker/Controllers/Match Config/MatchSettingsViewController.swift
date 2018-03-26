//
//  MatchSettingsViewController.swift
//  SquashMarker
//
//  Created by Jamil Nawaz on 16/02/2018.
//  Copyright © 2018 Jamil Nawaz. All rights reserved.
//

import UIKit

fileprivate let reuseIdentifier = "matchSettingsCell"
fileprivate let headerHeight = 100.0

class MatchSettingsViewController: UIViewController {
    @IBOutlet weak var matchSetupTable: UITableView!
    var tableArray = [SMCellData]()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        roundTableCorners()
        setupDataSourceAndDelegate()
        lockTableScrolling()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func dismissController(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    /// Setup the datasource and delegate for the method which is in a separate class
    func setupDataSourceAndDelegate() {
        
        tableArray = [
            SMCellData(cellType: .playerDetails),
            SMCellData(cellType: .playerDetails),
            SMCellData(cellType: .bestOfGames),
            SMCellData(cellType: .scoringSystem),
            SMCellData(cellType: .scoringTo)
        ]

        matchSetupTable.dataSource = self
        matchSetupTable.delegate = self
        
    }
    
    // MARK: Table Visuals
    func roundTableCorners() {
        matchSetupTable.layer.cornerRadius = 8
    }
    
    // MARK: Table Functionalities
    func lockTableScrolling() {
        matchSetupTable.isScrollEnabled = false
    }
}

// MARK: TableView Datasource
extension MatchSettingsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier) as? SMSettingTableViewCell
        if cell == nil {
            cell = SMSettingTableViewCell(style: .default, reuseIdentifier: reuseIdentifier)
        }
        cell?.selectionStyle = .none
        cell?.isHomePlayer = (indexPath.row == 0) ? true : false
        cell?.cellSettingType = tableArray[indexPath.row].cellType
        cell?.configure()
        cell?.refreshDelegate = self
        return cell!
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
}

// MARK: TableView Delegate
extension MatchSettingsViewController: UITableViewDelegate {
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
        
        let matchSetupLabel = UILabel(frame: header.frame)
        matchSetupLabel.text = "Matchplay Settings"
        matchSetupLabel.textAlignment = .center
        matchSetupLabel.font = UIFont(name: "Montserrat-SemiBold", size: 16.0)
        matchSetupLabel.textColor = SMColors.antiFlashWhite()
        
        header.addSubview(matchSetupLabel)
        
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat(headerHeight)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        default:
            return CGFloat(100.0)
        }
    }
}

extension MatchSettingsViewController: SMTableViewReloader {
    
    func refreshTable() {
        matchSetupTable.reloadData()
    }
    
    func updateScoringToCell(switcher: UISwitch) {
        
        let scoringToCell = self.matchSetupTable.cellForRow(at: IndexPath(row: 4, section: 0)) as! SMSettingTableViewCell
        switch switcher.tag {
        case 0:
            // Scoring Style Cell
            if switcher.isOn {
                scoringToCell.leftConfigLabel.text = ""
                scoringToCell.rightConfigLabel.text = "9"
            } else {
                scoringToCell.leftConfigLabel.text = "11"
                scoringToCell.rightConfigLabel.text = "15"
            }
            
        case 1:
            break
            
        default:
            break
        }
    }
}
