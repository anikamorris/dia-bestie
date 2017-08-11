//
//  ChoosePasswordViewController.swift
//  Dia-bestie
//
//  Created by Anika Morris on 8/10/17.
//  Copyright © 2017 Anika Morris. All rights reserved.
//

import Foundation
import UIKit
import Firebase

class ChoosePasswordViewController: UIViewController {
    
    @IBOutlet weak var enterEmailTextField: UITextField!
    @IBOutlet weak var enterPasswordTextField: UITextField!
    @IBOutlet weak var confirmEmailTextField: UITextField!
    @IBOutlet weak var nextButton: UIButton!
    
    var displayName: String?
    var isf: String?
    var targetBG: String?
    var insulinDuration: String?
    var midnightRatio: String?
    var twoAMRatio: String?
    var sixAMRatio: String?
    var nineAMRatio: String?
    var elevenAMRatio: String?
    var twoPMRatio: String?
    var sixPMRatio: String?
    var tenPMRatio: String?
    var password: String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeys))
        self.view.addGestureRecognizer(tapGestureRecognizer)
        
        enterEmailTextField.layer.cornerRadius = 20
        enterPasswordTextField.layer.cornerRadius = 20
        confirmEmailTextField.layer.cornerRadius = 20
        nextButton.layer.cornerRadius = 20
    }
    
    func dismissKeys() {
        self.view.endEditing(true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func nextButtonTapped(_ sender: UIButton) {
        print(displayName!)
        
        let statsISF = Int(isf!)
        let statsTargetBG = Int(targetBG!)
        let statsInsulinDuration = Double(insulinDuration!)
        let statsMidnightRatio = Int(midnightRatio!)
        let statsTwoAM = Int(twoAMRatio!)
        let statsSixAM = Int(sixAMRatio!)
        let statsNineAM = Int(nineAMRatio!)
        let statsElevenAM = Int(elevenAMRatio!)
        let statsTwoPM = Int(twoPMRatio!)
        let statsSixPM = Int(sixPMRatio!)
        let statsTenPM = Int(tenPMRatio!)
        
        let stats = Stats.init(targetBG: statsTargetBG!, insulinDuration: statsInsulinDuration!, isf: statsISF!, midnightRatio: statsMidnightRatio!, twoAM: statsTwoAM!, sixAM: statsSixAM!, nineAM: statsNineAM!, elevenAM: statsElevenAM!, twoPM: statsTwoPM!, sixPM: statsSixPM!, tenPM: statsTenPM!)
        
        guard let email = enterEmailTextField.text,
            !email.isEmpty else { return }
        
        guard let password1 = enterPasswordTextField.text,
            !password1.isEmpty else { return }
        
        guard let password2 = confirmEmailTextField.text,
            !password2.isEmpty else { return }
        
        if password1 == password2 {
            password = password1
            
            Auth.auth().createUser(withEmail: email, password: password) { (firUser, error) in
                // ...
                if let firUser = firUser {
                    
                    UserService.create(firUser, displayName: self.displayName!, stats: stats) { (user) in
                        guard let user = user else { return }
        
                        User.setCurrent(user, writeToUserDefaults: true)
        
                        let initialViewController = UIStoryboard.initialViewController(for: .main)
                        self.view.window?.rootViewController = initialViewController
                        self.view.window?.makeKeyAndVisible()
                    
                        print("Created new user: \(user.displayName)")
                    }
                } else { return }
                
               
            }
        } else {
            print("passwords don't match")
        }
        
        
    }
}
