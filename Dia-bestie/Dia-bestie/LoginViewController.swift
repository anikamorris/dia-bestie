//
//  LoginViewController.swift
//  Dia-bestie
//
//  Created by Anika Morris on 7/18/17.
//  Copyright © 2017 Anika Morris. All rights reserved.
//

import Foundation
import UIKit
import FirebaseAuth
import FirebaseAuthUI
import FirebaseDatabase

typealias FIRUser = FirebaseAuth.User

class LoginViewController: UIViewController { 
    
    @IBOutlet weak var enterEmailTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var taglineLabel: UILabel!
    @IBOutlet weak var logoImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginButton.layer.cornerRadius = 22.5
        enterEmailTextField.layer.cornerRadius = 22.5
        
        enterEmailTextField.attributedPlaceholder =
            NSAttributedString(string: "Enter Email", attributes:[NSForegroundColorAttributeName : UIColor.cyan])
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeys))
        self.view.addGestureRecognizer(tapGestureRecognizer)
        
    }
    
    func dismissKeys() {
        self.view.endEditing(true)
    }
    
    @IBAction func enterEmailTextFieldPrimaryActionTriggered(_ sender: Any) {
        dismissKeys()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        guard let authUI = FUIAuth.defaultAuthUI()
            else { return }
        
        authUI.delegate = self
        
        let authViewController = authUI.authViewController()
        present(authViewController, animated: true)
        
        
    }

}

extension LoginViewController: FUIAuthDelegate {
    func authUI(_ authUI: FUIAuth, didSignInWith user: FIRUser?, error: Error?) {
        if let error = error {
            print("Error signing in: \(error.localizedDescription)")
            return
        }
        
        guard let user = user
            else { return }
        
        let userRef = Database.database().reference().child("users").child(user.uid)
        
        userRef.observeSingleEvent(of: .value, with: { (snapshot) in
            if let user = User(snapshot: snapshot) {
                print("Welcome back, \(user.displayName).")
                
//                User.setCurrent(user, writeToUserDefaults: true)
                User.setCurrent(user)


                
                let initialViewController = UIStoryboard.initialViewController(for: .main)
                self.view.window?.rootViewController = initialViewController
                self.view.window?.makeKeyAndVisible()
            } else {
                self.performSegue(withIdentifier: Constants.Segue.toDisplayName, sender: self)
            }
        })
    }
}
