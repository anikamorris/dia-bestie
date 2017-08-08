//
//  ViewController.swift
//  Dia-bestie
//
//  Created by Anika Morris on 7/17/17.
//  Copyright © 2017 Anika Morris. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth

class EditingViewController: UIViewController {

    @IBOutlet var mainView: UIView!
    @IBOutlet weak var calculateButton: UIButton!
    @IBOutlet weak var isfTextField: UITextField!
    @IBOutlet weak var targetBGTextField: UITextField!
    @IBOutlet weak var insulinDurationTextField: UITextField!
    @IBOutlet weak var midnightRatioTextField: UITextField!
    @IBOutlet weak var twoAMTextField: UITextField!
    @IBOutlet weak var sixAMTextField: UITextField!
    @IBOutlet weak var nineAMTextField: UITextField!
    @IBOutlet weak var elevenAMTextField: UITextField!
    @IBOutlet weak var twoPMTextField: UITextField!
    @IBOutlet weak var sixPMTextField: UITextField!
    @IBOutlet weak var tenPMTextField: UITextField!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeys))
        self.view.addGestureRecognizer(tapGestureRecognizer)
        
        calculateButton.layer.cornerRadius = 6
        
       let name = User.current.displayName.capitalized
        nameLabel.text = "\(name)'s Stats"
    }
    
    func dismissKeys() {
        self.view.endEditing(true)
    }

    override func viewDidAppear(_ animated: Bool) {
        calculateButton.layer.cornerRadius = 6
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func unwindToEditingViewController(_ segue: UIStoryboardSegue) {
        
    }

//    @IBAction func buttonTapped(_ sender: UIButton) {
//        
//        // set ISF
//        guard let firUser = Auth.auth().currentUser,
//            let isf = isfTextField.text,
//            !isf.isEmpty else { return }
//        
//        let isfRef = Database.database().reference().child("users").child(firUser.uid)
//        
//        isfRef.updateChildValues(["isf": Int(isf)!])
//        
//        // set target blood sugar
//        guard let targetBG = targetBGTextField.text,
//            !targetBG.isEmpty else { return }
//        
//        let targetBGRef = Database.database().reference().child("users").child(firUser.uid)
//        
//        targetBGRef.updateChildValues(["targetBG": Int(targetBG)!])
//        
//        // set duration of insulin
//        guard let insulinDuration = insulinDurationTextField.text,
//            !insulinDuration.isEmpty else { return }
//        
//        let insulinDurationRef = Database.database().reference().child("users").child(firUser.uid)
//        
//        insulinDurationRef.updateChildValues(["insulinDuration": Int(insulinDuration)!])
//        
//        // set midnight carb ratio
//        guard let midnightRatio = midnightRatioTextField.text,
//            !midnightRatio.isEmpty else { return }
//        
//        let midnightRatioRef = Database.database().reference().child("users").child(firUser.uid)
//        
//        midnightRatioRef.updateChildValues(["midnightRatio": Int(midnightRatio)!])
//        
//        // set 2am carb ratio
//        guard let twoAM = twoAMTextField.text,
//            !twoAM.isEmpty else { return }
//        
//        let twoAMRef = Database.database().reference().child("users").child(firUser.uid)
//        
//        twoAMRef.updateChildValues(["twoAM": Int(twoAM)!])
//        
//        // set 6am carb ratio
//        guard let sixAM = sixAMTextField.text,
//            !sixAM.isEmpty else { return }
//        
//        let sixAMRef = Database.database().reference().child("users").child(firUser.uid)
//        
//        sixAMRef.updateChildValues(["sixAM": Int(sixAM)!])
//
//        // set 9am carb ratio
//        guard let nineAM = nineAMTextField.text,
//            !nineAM.isEmpty else { return }
//        
//        let nineAMRef = Database.database().reference().child("users").child(firUser.uid)
//        
//        nineAMRef.updateChildValues(["nineAM": Int(nineAM)!])
//        
//        // set 11am carb ratio
//        guard let elevenAM = elevenAMTextField.text,
//            !elevenAM.isEmpty else { return }
//        
//        let elevenAMRef = Database.database().reference().child("users").child(firUser.uid)
//        
//        elevenAMRef.updateChildValues(["elevenAM": Int(elevenAM)!])
//        
//        // set 2pm carb ratio
//        guard let twoPM = twoPMTextField.text,
//            !twoPM.isEmpty else { return }
//        
//        let twoPMRef = Database.database().reference().child("users").child(firUser.uid)
//        
//        twoPMRef.updateChildValues(["twoPM": Int(twoPM)!])
//        
//        // set 6pm carb ratio
//        guard let sixPM = sixPMTextField.text,
//            !sixPM.isEmpty else { return }
//        
//        let sixPMRef = Database.database().reference().child("users").child(firUser.uid)
//        
//        sixPMRef.updateChildValues(["sixPM": Int(sixPM)!])
//        
//        // set 10pm carb ratio
//        guard let tenPM = tenPMTextField.text,
//            !tenPM.isEmpty else { return }
//        
//        let tenPMRef = Database.database().reference().child("users").child(firUser.uid)
//        
//        tenPMRef.updateChildValues(["tenPM": Int(tenPM)!])
//       
//        print("everything is set")
//    }
    
    @IBAction func calculateButtonTapped(_ sender: UIButton) {
        // set ISF
        guard let firUser = Auth.auth().currentUser,
            let isf = isfTextField.text,
            !isf.isEmpty else { return }
        
        let isfRef = Database.database().reference().child("users").child(firUser.uid)
        
        isfRef.updateChildValues(["isf": Int(isf)!])
        
        // set target blood sugar
        guard let targetBG = targetBGTextField.text,
            !targetBG.isEmpty else { return }
        
        let targetBGRef = Database.database().reference().child("users").child(firUser.uid)
        
        targetBGRef.updateChildValues(["targetBG": Int(targetBG)!])
        
        // set duration of insulin
        guard let insulinDuration = insulinDurationTextField.text,
            !insulinDuration.isEmpty else { return }
        
        let insulinDurationRef = Database.database().reference().child("users").child(firUser.uid)
        
        insulinDurationRef.updateChildValues(["insulinDuration": Int(insulinDuration)!])
        
        // set midnight carb ratio
        guard let midnightRatio = midnightRatioTextField.text,
            !midnightRatio.isEmpty else { return }
        
        let midnightRatioRef = Database.database().reference().child("users").child(firUser.uid)
        
        midnightRatioRef.updateChildValues(["midnightRatio": Int(midnightRatio)!])
        
        // set 2am carb ratio
        guard let twoAM = twoAMTextField.text,
            !twoAM.isEmpty else { return }
        
        let twoAMRef = Database.database().reference().child("users").child(firUser.uid)
        
        twoAMRef.updateChildValues(["twoAM": Int(twoAM)!])
        
        // set 6am carb ratio
        guard let sixAM = sixAMTextField.text,
            !sixAM.isEmpty else { return }
        
        let sixAMRef = Database.database().reference().child("users").child(firUser.uid)
        
        sixAMRef.updateChildValues(["sixAM": Int(sixAM)!])
        
        // set 9am carb ratio
        guard let nineAM = nineAMTextField.text,
            !nineAM.isEmpty else { return }
        
        let nineAMRef = Database.database().reference().child("users").child(firUser.uid)
        
        nineAMRef.updateChildValues(["nineAM": Int(nineAM)!])
        
        // set 11am carb ratio
        guard let elevenAM = elevenAMTextField.text,
            !elevenAM.isEmpty else { return }
        
        let elevenAMRef = Database.database().reference().child("users").child(firUser.uid)
        
        elevenAMRef.updateChildValues(["elevenAM": Int(elevenAM)!])
        
        // set 2pm carb ratio
        guard let twoPM = twoPMTextField.text,
            !twoPM.isEmpty else { return }
        
        let twoPMRef = Database.database().reference().child("users").child(firUser.uid)
        
        twoPMRef.updateChildValues(["twoPM": Int(twoPM)!])
        
        // set 6pm carb ratio
        guard let sixPM = sixPMTextField.text,
            !sixPM.isEmpty else { return }
        
        let sixPMRef = Database.database().reference().child("users").child(firUser.uid)
        
        sixPMRef.updateChildValues(["sixPM": Int(sixPM)!])
        
        // set 10pm carb ratio
        guard let tenPM = tenPMTextField.text,
            !tenPM.isEmpty else { return }
        
        let tenPMRef = Database.database().reference().child("users").child(firUser.uid)
        
        tenPMRef.updateChildValues(["tenPM": Int(tenPM)!])
        
        print("everything is set")
        
        self.performSegue(withIdentifier: Constants.Segue.toMyStats, sender: self)
    }
}

