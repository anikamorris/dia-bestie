//
//  NoEatingViewController.swift
//  Dia-bestie
//
//  Created by Anika Morris on 7/24/17.
//  Copyright © 2017 Anika Morris. All rights reserved.
//

import Foundation
import UIKit

class EatingTwoViewController: UIViewController {
    
    @IBOutlet weak var yesButton: UIButton!
    @IBOutlet weak var noButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        yesButton.layer.cornerRadius = 62.5
        noButton.layer.cornerRadius = 62.5
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func yesButtonTapped(_ sender: UIButton) {
        self.performSegue(withIdentifier: Constants.Segue.toNoYesCalc, sender: self)
    }
    
    @IBAction func noButtonTapped(_ sender: Any) {
        self.performSegue(withIdentifier: Constants.Segue.toNoNoCalc, sender: self)
    }
    
    @IBAction func unwindToEatingTwoViewController(_ segue: UIStoryboardSegue) {
        
    }
}
