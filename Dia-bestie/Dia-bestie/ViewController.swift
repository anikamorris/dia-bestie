//
//  ViewController.swift
//  Dia-bestie
//
//  Created by Anika Morris on 7/17/17.
//  Copyright © 2017 Anika Morris. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var calculateButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func unwindToStatsViewController(_ segue: UIStoryboardSegue) {
        
    }

    @IBAction func calculateButtonTapped(_ sender: UIButton) {
        self.performSegue(withIdentifier: Constansts.Segue.toCorrections, sender: self)
    }

}

