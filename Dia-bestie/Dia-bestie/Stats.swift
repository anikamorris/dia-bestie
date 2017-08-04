//
//  Stats.swift
//  Dia-bestie
//
//  Created by Anika Morris on 8/2/17.
//  Copyright © 2017 Anika Morris. All rights reserved.
//

import Foundation
import FirebaseDatabase.FIRDataSnapshot

class Stats: NSObject {
    
    
    let targetBG: Int
    let insulinDuration: Int
    let isf: Int
    let midnightRatio: Int
    let twoAM: Int
    let sixAM: Int
    let nineAM: Int
    let elevenAM: Int
    let twoPM: Int
    let sixPM: Int
    let tenPM: Int

    required init?(coder aDecoder: NSCoder) {
        guard let targetBG = aDecoder.decodeObject(forKey: Constants.UserDefaults.targetBG) as? Int,
            let insulinDuration = aDecoder.decodeObject(forKey: Constants.UserDefaults.insulinDuration) as? Int,
            let isf = aDecoder.decodeObject(forKey: Constants.UserDefaults.isf) as? Int,
            let midnightRatio = aDecoder.decodeObject(forKey: Constants.UserDefaults.midnightRatio) as? Int,
            let twoAM = aDecoder.decodeObject(forKey: Constants.UserDefaults.twoAM) as? Int,
            let sixAM = aDecoder.decodeObject(forKey: Constants.UserDefaults.sixAM) as? Int,
            let nineAM = aDecoder.decodeObject(forKey: Constants.UserDefaults.nineAM) as? Int,
            let elevenAM = aDecoder.decodeObject(forKey: Constants.UserDefaults.elevenAM) as? Int,
            let twoPM = aDecoder.decodeObject(forKey: Constants.UserDefaults.twoPM) as? Int,
            let sixPM = aDecoder.decodeObject(forKey: Constants.UserDefaults.sixPM) as? Int,
            let tenPM = aDecoder.decodeObject(forKey: Constants.UserDefaults.tenPM) as? Int
        else { return nil }
        
        self.targetBG = targetBG
        self.insulinDuration = insulinDuration
        self.isf = isf
        self.midnightRatio = midnightRatio
        self.twoAM = twoAM
        self.sixAM = sixAM
        self.nineAM = nineAM
        self.elevenAM = elevenAM
        self.twoPM = twoPM
        self.sixPM = sixPM
        self.tenPM = tenPM
        super.init()
    }
    
    init(targetBG: Int, insulinDuration: Int, isf: Int, midnightRatio: Int, twoAM: Int, sixAM: Int, nineAM: Int, elevenAM: Int, twoPM: Int, sixPM: Int, tenPM: Int) {
        self.targetBG = targetBG
        self.insulinDuration = insulinDuration
        self.isf = isf
        self.midnightRatio = midnightRatio
        self.twoAM = twoAM
        self.sixAM = sixAM
        self.nineAM = nineAM
        self.elevenAM = elevenAM
        self.twoPM = twoPM
        self.sixPM = sixPM
        self.tenPM = tenPM
    }

    
    init?(snapshot: DataSnapshot) {
        guard let dict = snapshot.value as? [String : Any],
            let targetBG = dict["targetBG"] as? Int,
            let insulinDuration = dict["insulinDuration"] as? Int,
            let isf = dict["isf"] as? Int,
            let midnightRatio = dict["midnightRatio"] as? Int,
            let twoAM = dict["twoAM"] as? Int,
            let sixAM = dict["sixAM"] as? Int,
            let nineAM = dict["nineAM"] as? Int,
            let elevenAM = dict["elevenAM"] as? Int,
            let twoPM = dict["twoPM"] as? Int,
            let sixPM = dict["sixPM"] as? Int,
            let tenPM = dict["tenPM"] as? Int
            else { return nil }
        
        self.targetBG = targetBG
        self.insulinDuration = insulinDuration
        self.isf = isf
        self.midnightRatio = midnightRatio
        self.twoAM = twoAM
        self.sixAM = sixAM
        self.nineAM = nineAM
        self.elevenAM = elevenAM
        self.twoPM = twoPM
        self.sixPM = sixPM
        self.tenPM = tenPM
    }
    
    
    
}
