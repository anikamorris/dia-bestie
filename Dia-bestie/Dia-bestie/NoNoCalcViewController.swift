//
//  NoNoCalcViewController.swift
//  Dia-bestie
//
//  Created by Anika Morris on 7/24/17.
//  Copyright © 2017 Anika Morris. All rights reserved.
//

import Foundation
import UIKit

class NoNoCalcViewController: UIViewController {
    
    @IBOutlet weak var backButton: UIButton!
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

    override func viewDidAppear(_ animated: Bool) {
        numberOfUnitsLabel.textColor = UIColor.white
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func findTotalUnitsButtonTapped(_ sender: UIButton) {
        numberOfUnitsLabel.textColor = UIColor(
            red: 0x33/255,
            green: 0x33/255,
            blue: 0x33/255,
            alpha: 1.0)
        
        guard let currentsBG = currentBGTextField.text,
            !currentsBG.isEmpty else { return }
        
        let currentBG = Int(currentsBG)
        
        numberOfUnitsLabel.text = ("\(correctionUnits(currentBG: currentBG!)) units")
        
    }
    
    let isf = User.current.stats.isf
    let targetBG = User.current.stats.targetBG
    
    func correctionUnits(currentBG: Int) -> Double {
      
        let correctionUnits = Double(currentBG - 100) / Double(isf)
        print(correctionUnits)
        
        var totalUnits: Double
        totalUnits = correctionUnits
        totalUnits = (round(totalUnits * 10)) / 10
        
        return totalUnits
    }

}
