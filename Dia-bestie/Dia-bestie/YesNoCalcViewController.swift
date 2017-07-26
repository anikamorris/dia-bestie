//
//  YesNoCalcViewController.swift
//  Dia-bestie
//
//  Created by Anika Morris on 7/24/17.
//  Copyright © 2017 Anika Morris. All rights reserved.
//

import Foundation
import UIKit

class YesNoCalcViewController: UIViewController {
    
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var currentBGTextField: UITextField!
    @IBOutlet weak var findTotalUnitsButton: UIButton!
    @IBOutlet weak var numberOfUnitsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        numberOfUnitsLabel.textColor = UIColor.white
    }
    
    override func viewDidAppear(_ animated: Bool) {
        numberOfUnitsLabel.textColor = UIColor.white
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func findTotalUnitsButtonTapped(_ sender: UIButton) {
    }
    
}
