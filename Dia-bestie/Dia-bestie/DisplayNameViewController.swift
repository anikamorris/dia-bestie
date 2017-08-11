//
//  displayNameViewController.swift
//  Dia-bestie
//
//  Created by Anika Morris on 7/24/17.
//  Copyright © 2017 Anika Morris. All rights reserved.
//

import Foundation
import UIKit
import FirebaseDatabase
import FirebaseAuth

class DisplayNameViewController: UIViewController {
    
    @IBOutlet weak var displayNameTextField: UITextField!
    @IBOutlet weak var nextButton: UIButton!
    
    var displayName: String?
    var canSegue = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeys))
        self.view.addGestureRecognizer(tapGestureRecognizer)
        
        displayNameTextField.layer.cornerRadius = 20
        nextButton.layer.cornerRadius = 20
        
        displayNameTextField.addTarget(self, action: #selector(DisplayNameViewController.textFieldDidChange(textField:)), for: .editingChanged)
    }
    
    func dismissKeys() {
        self.view.endEditing(true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if let identifier = segue.identifier {
            if identifier == Constants.Segue.toSetMyStats {
                let setMyStatsViewController = segue.destination as! SetMyStatsViewController
                setMyStatsViewController.displayName = displayNameTextField.text!
            }
        }
    }
    
    @IBAction func unwindToDisplayNameViewController(_ segue: UIStoryboardSegue) {
        
    }
    
    func textFieldDidChange(textField: UITextField) {
        canSegue = (textField.text != "")
    }
    
    @IBAction func nextButtonTapped(_ sender: Any) {
    // create user account here
//        guard let firUser = Auth.auth().currentUser,
//            let displayName = displayNameTextField.text,
//            !displayName.isEmpty else { return }
//        
//        UserService.create(firUser, displayName: displayName) { (user) in
//            guard let user = user else { return }
//            
//            User.setCurrent(user, writeToUserDefaults: true)
//
//            let initialViewController = UIStoryboard.initialViewController(for: .main)
//            self.view.window?.rootViewController = initialViewController
//            self.view.window?.makeKeyAndVisible()
//            
//            print("Created new user: \(user.displayName)")
//        }
        
        if canSegue {
            performSegue(withIdentifier: Constants.Segue.toSetMyStats, sender: self)
        } else {
            print("no")
        }
    }
}
