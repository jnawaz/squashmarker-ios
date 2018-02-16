//
//  MatchSetupViewController.swift
//  SquashMarker
//
//  Created by Jamil Nawaz on 16/02/2018.
//  Copyright © 2018 Jamil Nawaz. All rights reserved.
//

import UIKit

class MatchSetupViewController: UIViewController {

    @IBOutlet weak var startGameButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        edgesForExtendedLayout = []
        navigationController?.isNavigationBarHidden = true
        
        startGameButton.shake()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func pressedMatchSetup(_ sender: Any) {
     
        
        
    }

}
