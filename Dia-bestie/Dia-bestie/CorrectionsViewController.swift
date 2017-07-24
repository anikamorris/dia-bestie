//
//  CorrectionsViewController.swift
//  Dia-bestie
//
//  Created by Anika Morris on 7/24/17.
//  Copyright © 2017 Anika Morris. All rights reserved.
//

import Foundation
import UIKit

class CorrectionsViewController: UIViewController {
    
    @IBOutlet weak var yesButton: UIButton!
    @IBOutlet weak var noButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func yesButtonTapped(_ sender: UIButton) {
        self.performSegue(withIdentifier: Constansts.Segue.toEatingOne, sender: self)
    }
    
    @IBAction func noButtonTapped(_ sender: UIButton) {
        self.performSegue(withIdentifier: Constansts.Segue.toEatingTwo, sender: self)
    }
    
    @IBAction func unwindToCorrectionsController(_ segue: UIStoryboardSegue) {
        
    }
}
