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
    
    var uid: String
    var displayName: String
    var stats: Stats

    
    // MARK: - Init
    
    required init?(coder aDecoder: NSCoder) {
        guard let uid = aDecoder.decodeObject(forKey: Constants.UserDefaults.uid) as? String,
            let displayName = aDecoder.decodeObject(forKey: Constants.UserDefaults.displayName) as? String,
            let stats = aDecoder.decodeObject(forKey: Constants.UserDefaults.stats) as? Stats,
            let isf = aDecoder.decodeObject(forKey: Constants.UserDefaults.isf) as? Int,
            let insulinDuration = aDecoder.decodeObject(forKey: Constants.UserDefaults.insulinDuration) as? Double,
            let targetBG = aDecoder.decodeObject(forKey: Constants.UserDefaults.targetBG) as? Int,
            let midnightRatio = aDecoder.decodeObject(forKey: Constants.UserDefaults.midnightRatio) as? Int,
            let twoAM = aDecoder.decodeObject(forKey: Constants.UserDefaults.twoAM) as? Int,
            let sixAM = aDecoder.decodeObject(forKey: Constants.UserDefaults.sixAM) as? Int,
            let nineAM = aDecoder.decodeObject(forKey: Constants.UserDefaults.nineAM) as? Int,
            let elevenAM = aDecoder.decodeObject(forKey: Constants.UserDefaults.elevenAM) as? Int,
            let twoPM = aDecoder.decodeObject(forKey: Constants.UserDefaults.twoPM) as? Int,
            let sixPM = aDecoder.decodeObject(forKey: Constants.UserDefaults.sixPM) as? Int,
            let tenPM = aDecoder.decodeObject(forKey: Constants.UserDefaults.tenPM) as? Int

        
            else { return nil }
        
        self.uid = uid
        self.displayName = displayName
        self.stats = stats
        
        super.init()
    }
    
    init(uid: String, displayName: String, stats: Stats) {
        self.uid = uid
        self.displayName = displayName
        self.stats = stats
        
        super.init()
    }


    init?(snapshot: DataSnapshot) {
        guard let dict = snapshot.value as? [String : Any],
            let displayName = dict["displayName"] as? String,
            let stats = Stats(snapshot: snapshot)
            else { return nil }
        
        self.uid = snapshot.key
        self.displayName = displayName
        self.stats = stats

        super.init()
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
    
    class func setCurrent(_ user: User, writeToUserDefaults: Bool = false) {

        if writeToUserDefaults {
            let data = NSKeyedArchiver.archivedData(withRootObject: user)
            UserDefaults.standard.set(data, forKey: Constants.UserDefaults.currentUser)
        }
        
        _current = user
    }
    
    func getDict() -> [String: Any] {
        var dict = self.stats.getDict()
        dict["displayName"] = displayName
        
        return dict
    }
}
    


extension User: NSCoding {
    func encode(with aCoder: NSCoder) {
        aCoder.encode(uid, forKey: Constants.UserDefaults.uid)
        aCoder.encode(displayName, forKey: Constants.UserDefaults.displayName)
        aCoder.encode(stats.isf, forKey: Constants.UserDefaults.isf)
        aCoder.encode(stats.targetBG, forKey: Constants.UserDefaults.targetBG)
        aCoder.encode(stats.insulinDuration, forKey: Constants.UserDefaults.insulinDuration)
        aCoder.encode(stats.midnightRatio, forKey: Constants.UserDefaults.midnightRatio)
        aCoder.encode(stats.twoAM, forKey: Constants.UserDefaults.twoAM)
        aCoder.encode(stats.sixAM, forKey: Constants.UserDefaults.sixAM)
        aCoder.encode(stats.nineAM, forKey: Constants.UserDefaults.nineAM)
        aCoder.encode(stats.elevenAM, forKey: Constants.UserDefaults.elevenAM)
        aCoder.encode(stats.twoPM, forKey: Constants.UserDefaults.twoPM)
        aCoder.encode(stats.sixPM, forKey: Constants.UserDefaults.sixPM)
        aCoder.encode(stats.tenPM, forKey: Constants.UserDefaults.tenPM)
    }
}

  
