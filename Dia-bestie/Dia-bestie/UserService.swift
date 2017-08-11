//
//  UserService.swift
//  Dia-bestie
//
//  Created by Anika Morris on 7/21/17.
//  Copyright © 2017 Anika Morris. All rights reserved.
//

import Foundation
import FirebaseAuth.FIRUser
import FirebaseDatabase

struct UserService {
    
    static func show(forUID uid: String, completion: @escaping (User?) -> Void) {
        let ref = Database.database().reference().child("users").child(uid)
        ref.observeSingleEvent(of: .value, with: { (snapshot) in
            guard let user = User(snapshot: snapshot) else {
                return completion(nil)
            }
            
            completion(user)
        })
    }
    
    static func create(_ firUser: FIRUser, displayName: String, stats: Stats, completion: @escaping (User?) -> Void) {
        let user = User(uid: firUser.uid, displayName: displayName, stats: stats)
        let userAttrs = user.getDict()
        
        let ref = Database.database().reference().child("users").child(firUser.uid)
        ref.setValue(userAttrs) { (error, ref) in
            if let error = error {
                print(error.localizedDescription)
                return completion(nil)
            }
            
            ref.observeSingleEvent(of: .value, with: { (snapshot) in
                if let user = User(snapshot: snapshot) {
                    completion(user)
                } else {
                    completion(nil)
                }
            })
        }
    }
}
