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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        roundTableCorners()
        
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
