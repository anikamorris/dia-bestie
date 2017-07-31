//
//  YesYesCalcViewController.swift
//  Dia-bestie
//
//  Created by Anika Morris on 7/24/17.
//  Copyright © 2017 Anika Morris. All rights reserved.
//

import Foundation
import UIKit
import FirebaseDatabase

class YesYesCalcViewController: UIViewController {
    
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var carbsTextField: UITextField!
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
        numberOfUnitsLabel.textColor = UIColor.darkGray
        
    }
    
//    init?(snapshot: DataSnapshot) {
//        guard let dict = snapshot.value as? [String : Any],
//            let targetBG = dict["target"] as? Double,
//            let isf = dict["isf"] as? Double,
//            let insulinDuration = dict["insulinDuration"] as? Double
//            else { return nil }
//        
//        self.targetBG = targetBG
//        self.isf = isf
//        self.insulinDuration = insulinDuration
//    }
//    
//    func snackCorrection(units: Double, hours: Double, current: Double, target: Double, isf: Double, duration: Double) -> Double {
//        
//        
//        
//        let units = Double(previousUnitsTextField.text!)
//        let hours = Double(hoursSinceTextField.text!)
//        let current = Double(currentBGTextField.text!)
//        let target = Double()
//        }
}







