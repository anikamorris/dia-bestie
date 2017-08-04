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
    @IBOutlet weak var previousUnitsTextField: UITextField!
    @IBOutlet weak var hoursSinceTextField: UITextField!
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
        let currentBG = Double(currentsBG)
        
        guard let previousUnits = previousUnitsTextField.text,
            !previousUnits.isEmpty else { return }
        let previousUnit = Double(previousUnits)
        
        guard let hoursSince = hoursSinceTextField.text,
            !hoursSince.isEmpty else { return }
        let hourSince = Double(hoursSince)
        
        numberOfUnitsLabel.text = ("\(foodUnits(currentBG: currentBG!, previousUnit: previousUnit!, hourSince: hourSince!)) units")
        
    }
    
    let isf = User.current.stats.isf
    let insulinDuration = User.current.stats.insulinDuration
    let targetBG = User.current.stats.targetBG
    
    func foodUnits(currentBG: Double, previousUnit: Double, hourSince: Double) -> Double {
        
        let correctionUnits = ((currentBG - Double(targetBG)) / Double(isf)) - (previousUnit - (previousUnit * (hourSince / Double(insulinDuration))))
        print(foodUnits)
        print(correctionUnits)
        
        var totalUnits: Double
        totalUnits = correctionUnits
        totalUnits = (round(totalUnits * 10)) / 10
        
        return totalUnits
    }
}
