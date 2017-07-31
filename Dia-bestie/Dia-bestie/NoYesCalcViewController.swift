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
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeys))
        self.view.addGestureRecognizer(tapGestureRecognizer)
        
        numberOfUnitsLabel.textColor = UIColor.white
        findTotalUnitsButton.layer.cornerRadius = 8
    }
    
    func dismissKeys() {
        self.view.endEditing(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        numberOfUnitsLabel.textColor = UIColor.white
    }
    
    @IBAction func findTotalUnitsButtonTapped(_ sender: UIButton) {
        numberOfUnitsLabel.textColor = UIColor.darkGray

    }
    
}
