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
    
    // MARK: - Init
    
    init(uid: String, displayName: String) {
        self.uid = uid
        self.displayName = displayName
    }


    init?(snapshot: DataSnapshot) {
        guard let dict = snapshot.value as? [String : Any],
            let displayName = dict["displayName"] as? String
            else { return nil }
        
        self.uid = snapshot.key
        self.displayName = displayName
    }
    
    // MARK: - Singleton

    private static var _current: User?
    
    // 2
    static var current: User {
        // 3
        guard let currentUser = _current else {
            fatalError("Error: current user doesn't exist")
        }
        
        // 4
        return currentUser
    }
    
    // MARK: - Class Methods
    
    // 5
    static func setCurrent(_ user: User) {
        _current = user
    }
}

  
