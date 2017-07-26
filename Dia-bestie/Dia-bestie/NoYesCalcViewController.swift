//
//  NoYesCalcViewController.swift
//  Dia-bestie
//
//  Created by Anika Morris on 7/24/17.
//  Copyright © 2017 Anika Morris. All rights reserved.
//

import Foundation
import UIKit

class NoYesCalcViewController: UIViewController {
    
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var carbsTextField: UITextField!
    @IBOutlet weak var currentBGTextField: UITextField!
    @IBOutlet weak var findTotalUnitsButton: UIButton!
    @IBOutlet weak var numberOfUnitsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        numberOfUnitsLabel.textColor = UIColor.white
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        numberOfUnitsLabel.textColor = UIColor.white
    }
    
    @IBAction func findTotalUnitsButtonTapped(_ sender: UIButton) {
    }
    
}
