//
//  User.swift
//  Dia-bestie
//
//  Created by Anika Morris on 7/21/17.
//  Copyright © 2017 Anika Morris. All rights reserved.
//

import Foundation
import FirebaseDatabase.FIRDataSnapshot

class User: NSObject {
    
    // MARK: - Properties
    
    let uid: String
    let displayName: String
//    let targetBG: Int
//    let insulinDuration: Int
//    let isf: Int
    
    // MARK: - Init
    
    required init?(coder aDecoder: NSCoder) {
        guard let uid = aDecoder.decodeObject(forKey: Constants.UserDefaults.uid) as? String,
            let displayName = aDecoder.decodeObject(forKey: Constants.UserDefaults.displayName) as? String
//            let targetBG = aDecoder.decodeObject(forKey: Constants.UserDefaults.targetBG) as? Int,
//            let insulinDuration = aDecoder.decodeObject(forKey: Constants.UserDefaults.insulinDuration) as? Int,
//            let isf = aDecoder.decodeObject(forKey: Constants.UserDefaults.isf) as? Int
            else { return nil }
        
        self.uid = uid
        self.displayName = displayName
//        self.targetBG = targetBG
//        self.insulinDuration = insulinDuration
//        self.isf = isf
        
        super.init()
    }
    
    init(uid: String, displayName: String, targetBG: Int, insulinDuration: Int, isf: Int) {
        self.uid = uid
        self.displayName = displayName
//        self.targetBG = targetBG
//        self.insulinDuration = insulinDuration
//        self.isf = isf
    }


    init?(snapshot: DataSnapshot) {
        guard let dict = snapshot.value as? [String : Any],
            let displayName = dict["displayName"] as? String
//            let targetBG = dict["targetBG"] as? Int,
//            let insulinDuration = dict["insulinDuration"] as? Int,
//            let isf = dict["isf"] as? Int
            else { return nil }
        
        self.uid = snapshot.key
        self.displayName = displayName
//        self.targetBG = targetBG
//        self.insulinDuration = insulinDuration
//        self.isf = isf
    }
    
   
    
    // MARK: - Singleton

    private static var _current: User?
    
    static var current: User {
        guard let currentUser = _current else {
            fatalError("Error: current user doesn't exist")
        }
        
        return currentUser
    }
    
    // MARK: - Class Methods
    
    static func setCurrent(_ user: User) {
    //static func setCurrent(_ user: User, writeToUserDefaults: Bool = false) {

//        if writeToUserDefaults {
//            let data = NSKeyedArchiver.archivedData(withRootObject: user)
//            UserDefaults.standard.set(data, forKey: Constants.UserDefaults.currentUser)
//        }
        
        _current = user
    }
    
    
}

extension User: NSCoding {
    func encode(with aCoder: NSCoder) {
        aCoder.encode(uid, forKey: Constants.UserDefaults.uid)
        aCoder.encode(displayName, forKey: Constants.UserDefaults.displayName)
//        aCoder.encode(targetBG, forKey: Constants.UserDefaults.targetBG)
    }
}

  
