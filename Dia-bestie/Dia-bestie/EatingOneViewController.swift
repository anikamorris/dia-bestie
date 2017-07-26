//
//  YesEatingViewController.swift
//  Dia-bestie
//
//  Created by Anika Morris on 7/24/17.
//  Copyright © 2017 Anika Morris. All rights reserved.
//

import Foundation
import UIKit

class EatingOneViewController: UIViewController {
    
    @IBOutlet weak var yesButton: UIButton!
    @IBOutlet weak var noButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        yesButton.layer.cornerRadius = 5
        noButton.layer.cornerRadius = 5
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func yesButtonTapped(_ sender: UIButton) {
        self.performSegue(withIdentifier: Constansts.Segue.toYesYesCalc, sender: self)
    }
    
    @IBAction func noButtonTapped(_ sender: UIButton) {
        self.performSegue(withIdentifier: Constansts.Segue.toYesNoCalc, sender: self)
    }
    
    @IBAction func unwindToEatingOneViewController(_ segue: UIStoryboardSegue) {
        
    }
}
