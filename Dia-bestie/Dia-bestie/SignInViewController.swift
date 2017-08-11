//
//  SignInViewController.swift
//  Dia-bestie
//
//  Created by Anika Morris on 8/8/17.
//  Copyright © 2017 Anika Morris. All rights reserved.
//

import Foundation
import UIKit
import FirebaseAuth
import FirebaseDatabase
import Firebase

class SignInViewController: UIViewController {
    
    @IBOutlet weak var enterEmailTextField: UITextField!
    @IBOutlet weak var enterPasswordTextField: UITextField!
    @IBOutlet weak var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        enterEmailTextField.layer.cornerRadius = 20
        enterPasswordTextField.layer.cornerRadius = 20
        nextButton.layer.cornerRadius = 20
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeys))
        self.view.addGestureRecognizer(tapGestureRecognizer)
    }

    func dismissKeys() {
        self.view.endEditing(true)
    }

    @IBAction func enterEmailTextFieldPrimaryActionTriggered(_ sender: Any) {
        dismissKeys()
    }

    @IBAction func enterPasswordTextFieldPrimaryActionTriggered(_ sender: Any) {
        dismissKeys()
    }

    @IBAction func nextButtonTapped(_ sender: UIButton) {
        guard let email = enterEmailTextField.text,
            !email.isEmpty else { return }
        
        guard let password = enterPasswordTextField.text,
            !password.isEmpty else { return }
        
        Auth.auth().signIn(withEmail: email, password: password) { (firUser, error) in
            // ...
            if let error = error {
                print(error.localizedDescription)
            } else {
                guard let firUser = firUser else { return }
            
                UserService.show(forUID: firUser.uid) { (user) in
                    if let user = user {
                        // handle existing user
                        User.setCurrent(user, writeToUserDefaults: true)
                        
                        let storyboard = UIStoryboard(name: "Main", bundle: .main)
                        if let initialViewController = storyboard.instantiateInitialViewController() {
                            self.view.window?.rootViewController = initialViewController
                            self.view.window?.makeKeyAndVisible()
                        }
                    } else {
                        print("email doesn't exist or email and password don't match")
                    }
                }
        
            }
        }
    }
}
