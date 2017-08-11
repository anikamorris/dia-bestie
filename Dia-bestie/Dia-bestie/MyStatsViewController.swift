//
//  MyStatsViewController.swift
//  Dia-bestie
//
//  Created by Anika Morris on 8/4/17.
//  Copyright © 2017 Anika Morris. All rights reserved.
//

import Foundation
import UIKit
import FirebaseDatabase
import FirebaseAuth

class MyStatsViewController: UIViewController {
    
    @IBOutlet weak var displayISFLabel: UILabel!
    @IBOutlet weak var displayTargetBGLabel: UILabel!
    @IBOutlet weak var displayInsulinDurationLabel: UILabel!
    @IBOutlet weak var calculateButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var editButton: UIButton!
    @IBOutlet weak var signOutButton: UIButton!
    
    var statsArray = [Int]()
    var timesArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        statsArray = [User.current.stats.midnightRatio,
                      User.current.stats.twoAM,
                      User.current.stats.sixAM,
                      User.current.stats.nineAM,
                      User.current.stats.elevenAM,
                      User.current.stats.twoPM,
                      User.current.stats.sixPM,
                      User.current.stats.tenPM]
        
        timesArray = ["12:00 AM",
                      "2:00 AM",
                      "6:00 AM",
                      "9:00 AM",
                      "11:00 AM",
                      "2:00 PM",
                      "6:00 PM",
                      "10:00 PM"]
        
        let name = User.current.displayName.capitalized
        nameLabel.text = "\(name)'s Stats"
        
        let isf = User.current.stats.isf
        let insulinDuration = User.current.stats.insulinDuration
        let targetBG = User.current.stats.targetBG
        
        displayISFLabel.text = String(isf)
        displayTargetBGLabel.text = String(targetBG)
        displayInsulinDurationLabel.text = String(Int(insulinDuration))
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let isf = User.current.stats.isf
        let insulinDuration = User.current.stats.insulinDuration
        let targetBG = User.current.stats.targetBG
        
        displayISFLabel.text = String(isf)
        displayTargetBGLabel.text = String(targetBG)
        displayInsulinDurationLabel.text = String(insulinDuration)
    }
    
    @IBAction func calculateButtonTapped(_ sender: UIButton) {
        self.performSegue(withIdentifier: Constants.Segue.toCorrections, sender: self)
    }
    
    @IBAction func editButtonTapped(_ sender: UIButton) {
        self.performSegue(withIdentifier: Constants.Segue.toEditing, sender: self)
    }
    
    @IBAction func signOutButtonTapped(_ sender: UIButton) {
        
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
        
        let initialViewController = UIStoryboard.initialViewController(for: .login)
        self.view.window?.rootViewController = initialViewController
        self.view.window?.makeKeyAndVisible()
    }
   
    @IBAction func unwindToMyStatsViewController(_ segue: UIStoryboardSegue) {
        
    }
    
}

extension MyStatsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "carbRatioTableViewCell", for: indexPath) as! CarbRatioTableViewCell
        
        cell.timeLabel.text = "\(timesArray[indexPath.row])"
        cell.ratioLabel.text = "\(statsArray[indexPath.row])"
        
        return cell
    }
}


