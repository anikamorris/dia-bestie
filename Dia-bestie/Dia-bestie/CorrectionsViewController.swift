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
    @IBOutlet weak var questionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        yesButton.layer.cornerRadius = 62.5
        noButton.layer.cornerRadius = 62.5
        
        questionLabel.text = "Have you done any corrections in the past \(User.current.stats.insulinDuration) hours?"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func yesButtonTapped(_ sender: UIButton) {
        self.performSegue(withIdentifier: Constants.Segue.toEatingOne, sender: self)
    }
    
    @IBAction func noButtonTapped(_ sender: UIButton) {
        self.performSegue(withIdentifier: Constants.Segue.toEatingTwo, sender: self)
    }
    
    @IBAction func unwindToCorrectionsController(_ segue: UIStoryboardSegue) {
        
    }
}
