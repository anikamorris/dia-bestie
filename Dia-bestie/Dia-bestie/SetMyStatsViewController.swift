//
//  SetMyStatsViewController.swift
//  Dia-bestie
//
//  Created by Anika Morris on 8/8/17.
//  Copyright © 2017 Anika Morris. All rights reserved.
//

import Foundation
import UIKit
import FirebaseDatabase
import FirebaseAuth
import Firebase

class SetMyStatsViewController: UIViewController {
    
    @IBOutlet weak var isfTextField: UITextField!
    @IBOutlet weak var targetBGTextField: UITextField!
    @IBOutlet weak var insulinDurationTextField: UITextField!
    @IBOutlet weak var midnightRatioTextField: UITextField!
    @IBOutlet weak var twoAMRatioTextField: UITextField!
    @IBOutlet weak var sixAMRatioTextField: UITextField!
    @IBOutlet weak var nineAMRatioTextField: UITextField!
    @IBOutlet weak var elevenAMRatioTextField: UITextField!
    @IBOutlet weak var twoPMRatioTextField: UITextField!
    @IBOutlet weak var sixPMRatioTextField: UITextField!
    @IBOutlet weak var tenPMRatioTextField: UITextField!
    @IBOutlet weak var nextButton: UIButton!
    
    var displayName: String = ""
    var canSegueISF = false
    var canSegueTargetBG = false
    var canSegueInsulinDuration = false
    var canSegueMidnightRatio = false
    var canSegueTwoAM = false
    var canSegueSixAM = false
    var canSegueNineAM = false
    var canSegueElevenAM = false
    var canSegueTwoPM = false
    var canSegueSixPM = false
    var canSegueTenPM = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeys))
        self.view.addGestureRecognizer(tapGestureRecognizer)
        
        isfTextField.addTarget(self, action: #selector(SetMyStatsViewController.isfTextFieldDidChange(textField:)), for: .editingChanged)
        
        targetBGTextField.addTarget(self, action: #selector(SetMyStatsViewController.targetBGTextFieldDidChange(textField:)), for: .editingChanged)
        
        insulinDurationTextField.addTarget(self, action: #selector(SetMyStatsViewController.insulinDurationTextFieldDidChange(textField:)), for: .editingChanged)
        
        midnightRatioTextField.addTarget(self, action: #selector(SetMyStatsViewController.midnightRatioTextFieldDidChange(textField:)), for: .editingChanged)
        
        twoAMRatioTextField.addTarget(self, action: #selector(SetMyStatsViewController.twoAMTextFieldDidChange(textField:)), for: .editingChanged)
        
        sixAMRatioTextField.addTarget(self, action: #selector(SetMyStatsViewController.sixAMTextFieldDidChange(textField:)), for: .editingChanged)
        
        nineAMRatioTextField.addTarget(self, action: #selector(SetMyStatsViewController.nineAMTextFieldDidChange(textField:)), for: .editingChanged)
        
        elevenAMRatioTextField.addTarget(self, action: #selector(SetMyStatsViewController.elevenAMTextFieldDidChange(textField:)), for: .editingChanged)
        
        twoPMRatioTextField.addTarget(self, action: #selector(SetMyStatsViewController.twoPMTextFieldDidChange(textField:)), for: .editingChanged)
        
        sixPMRatioTextField.addTarget(self, action: #selector(SetMyStatsViewController.sixPMTextFieldDidChange(textField:)), for: .editingChanged)
        
        tenPMRatioTextField.addTarget(self, action: #selector(SetMyStatsViewController.tenPMTextFieldDidChange(textField:)), for: .editingChanged)
        
    }
    
    func dismissKeys() {
        self.view.endEditing(true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        guard let isf = isfTextField.text,
//            !isf.isEmpty else { return }
//        
//        guard let targetBG = targetBGTextField.text,
//            !targetBG.isEmpty else { return }
//        
//        guard let insulinDuration = insulinDurationTextField.text,
//            !insulinDuration.isEmpty else { return }
//        
//        guard let midnightRatio = midnightRatioTextField.text,
//            !midnightRatio.isEmpty else { return }
//        
//        guard let twoAMRatio = twoAMRatioTextField.text,
//            !twoAMRatio.isEmpty else { return }
//        
//        guard let sixAMRatio = sixAMRatioTextField.text,
//            !sixAMRatio.isEmpty else { return }
//        
//        guard let nineAMRatio = nineAMRatioTextField.text,
//            !nineAMRatio.isEmpty else { return }
//        
//        guard let elevenAMRatio = elevenAMRatioTextField.text,
//            !elevenAMRatio.isEmpty else { return }
//        
//        guard let twoPMRatio = twoPMRatioTextField.text,
//            !twoPMRatio.isEmpty else { return }
//        
//        guard let sixPMRatio = sixAMRatioTextField.text,
//            !sixPMRatio.isEmpty else { return }
//        
//        guard let tenPMRatio = tenPMRatioTextField.text,
//            !tenPMRatio.isEmpty else { return }
//        
        if let identifier = segue.identifier {
            if identifier == Constants.Segue.toChoosePassword {
                let choosePasswordViewController = segue.destination as! ChoosePasswordViewController
                choosePasswordViewController.isf = isfTextField.text
                choosePasswordViewController.insulinDuration = insulinDurationTextField.text
                choosePasswordViewController.targetBG = targetBGTextField.text
                choosePasswordViewController.midnightRatio = midnightRatioTextField.text
                choosePasswordViewController.twoAMRatio = twoAMRatioTextField.text
                choosePasswordViewController.sixAMRatio = sixAMRatioTextField.text
                choosePasswordViewController.nineAMRatio = nineAMRatioTextField.text
                choosePasswordViewController.elevenAMRatio = elevenAMRatioTextField.text
                choosePasswordViewController.twoPMRatio = twoPMRatioTextField.text
                choosePasswordViewController.sixPMRatio = sixPMRatioTextField.text
                choosePasswordViewController.tenPMRatio = tenPMRatioTextField.text
                choosePasswordViewController.displayName = displayName
            }
        }
    }
    
    func isfTextFieldDidChange(textField: UITextField) {
        canSegueISF = (textField.text != "")
    }
    
    func targetBGTextFieldDidChange(textField: UITextField) {
        canSegueTargetBG = (textField.text != "")
    }
    
    func insulinDurationTextFieldDidChange(textField: UITextField) {
        canSegueInsulinDuration = (textField.text != "")
    }
    
    func midnightRatioTextFieldDidChange(textField: UITextField) {
        canSegueMidnightRatio = (textField.text != "")
    }
    
    func twoAMTextFieldDidChange(textField: UITextField) {
        canSegueTwoAM = (textField.text != "")
    }
    
    func sixAMTextFieldDidChange(textField: UITextField) {
        canSegueSixAM = (textField.text != "")
    }
    
    func nineAMTextFieldDidChange(textField: UITextField) {
        canSegueNineAM = (textField.text != "")
    }
    
    func elevenAMTextFieldDidChange(textField: UITextField) {
        canSegueElevenAM = (textField.text != "")
    }
    
    func twoPMTextFieldDidChange(textField: UITextField) {
        canSegueTwoPM = (textField.text != "")
    }
    
    func sixPMTextFieldDidChange(textField: UITextField) {
        canSegueSixPM = (textField.text != "")
    }
    
    func tenPMTextFieldDidChange(textField: UITextField) {
        canSegueTenPM = (textField.text != "")
    }
    
    @IBAction func unwindToSetMyStatsViewController(_ segue: UIStoryboardSegue) {
    }

    @IBAction func nextButtonTapped(_ sender: UIButton) {
        if canSegueISF && canSegueTargetBG && canSegueInsulinDuration && canSegueMidnightRatio && canSegueTwoAM && canSegueSixAM && canSegueNineAM && canSegueElevenAM && canSegueTenPM && canSegueSixPM && canSegueTenPM {
            performSegue(withIdentifier: Constants.Segue.toChoosePassword, sender: self)
            print(displayName as Any)
        } else {
            print("no")
        }
    }
}
