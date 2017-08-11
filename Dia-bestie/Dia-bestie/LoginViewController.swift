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
    
    @IBOutlet weak var taglineLabel: UILabel!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var logInButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        signUpButton.layer.cornerRadius = 22.5
        logInButton.layer.cornerRadius = 22.5
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func signUpButtonTapped(_ sender: UIButton) {
        self.performSegue(withIdentifier: Constants.Segue.toDisplayName, sender: self)
    }
    
    @IBAction func logInButtonTapped(_ sender: UIButton) {
        self.performSegue(withIdentifier: Constants.Segue.toSignIn, sender: self)
    }
    
    @IBAction func unwindToLoginViewController(_ segue: UIStoryboardSegue) {
        
    }
    
}
//
//extension LoginViewController: FUIAuthDelegate {
//    func authUI(_ authUI: FUIAuth, didSignInWith user: FIRUser?, error: Error?) {
//        if let error = error {
//            print("Error signing in: \(error.localizedDescription)")
//            return
//        }
//        
//        guard let user = user
//            else { return }
//        
//        let userRef = Database.database().reference().child("users").child(user.uid)
//        
//        userRef.observeSingleEvent(of: .value, with: { (snapshot) in
//            if let user = User(snapshot: snapshot) {
//                print("Welcome back, \(user.displayName).")
//                
//                User.setCurrent(user, writeToUserDefaults: true)
//
//                let initialViewController = UIStoryboard.initialViewController(for: .main)
//                self.view.window?.rootViewController = initialViewController
//                self.view.window?.makeKeyAndVisible()
//            } else {
//                self.performSegue(withIdentifier: Constants.Segue.toDisplayName, sender: self)
//            }
//        })
//    }
//}
