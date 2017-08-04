//
//  NoYesCalcViewController.swift
//  Dia-bestie
//
//  Created by Anika Morris on 7/24/17.
//  Copyright © 2017 Anika Morris. All rights reserved.
//

import Foundation
import UIKit
import FirebaseDatabase


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
        numberOfUnitsLabel.textColor = UIColor(
            red: 0x33/255,
            green: 0x33/255,
            blue: 0x33/255,
            alpha: 1.0)
        
        guard let carbs = carbsTextField.text,
            !carbs.isEmpty else { return }
        
        let carb = Int(carbs)
        
        
        guard let currentsBG = currentBGTextField.text,
            !currentsBG.isEmpty else { return }
        
        let currentBG = Int(currentsBG)
        
        numberOfUnitsLabel.text = ("\(foodUnits(carb: carb!, currentBG: currentBG!)) units")
        
    }
   
    let isf = User.current.stats.isf
    let insulinDuration = User.current.stats.insulinDuration
    let targetBG = User.current.stats.targetBG
    let midnightRatio = User.current.stats.midnightRatio
    let twoAM = User.current.stats.twoAM
    let sixAM = User.current.stats.sixAM
    let nineAM = User.current.stats.nineAM
    let elevenAM = User.current.stats.elevenAM
    let twoPM = User.current.stats.twoPM
    let sixPM = User.current.stats.sixPM
    let tenPM = User.current.stats.tenPM

    func foodUnits(carb: Int, currentBG: Int) -> Double {
        
                
        let date = Date()
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: date)
        
        var ratio: Int
        
        if hour < 2 {
            ratio = midnightRatio
        } else if hour < 6 {
            ratio = twoAM
        } else if hour < 9 {
            ratio = sixAM
        } else if hour < 11 {
            ratio = nineAM
        } else if hour < 14 {
            ratio = elevenAM
        } else if hour < 18 {
            ratio = twoPM
        } else if hour < 22 {
            ratio = sixPM
        } else {
            ratio = tenPM
        }
        
        
        
        let foodUnits = Double(carb) / Double(ratio)
        print(ratio)
        let correctionUnits = Double(currentBG - 100) / Double(isf)
        print(foodUnits)
        print(correctionUnits)
        
        var totalUnits: Double
        totalUnits = foodUnits + correctionUnits
        totalUnits = (round(totalUnits * 10)) / 10
        
        return totalUnits
    }
}
