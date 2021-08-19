//
//  FBUser.swift
//  Signin With Apple
//
//  Created by Stewart Lynch on 2020-03-18.
//  Copyright © 2020 CreaTECH Solutions. All rights reserved.
//

import Foundation

struct FBUser {
    let uid: String
    let first_name: String
    let last_name : String
    let email: String
    
    // App Specific properties can be added here
    
    init(uid: String, first_name: String, last_name:String, email: String) {
        self.uid = uid
        self.first_name = first_name
        self.last_name = last_name
        self.email = email
    }
}

extension FBUser {
    init?(documentData: [String : Any]) {
        let uid = documentData[FBKeys.User.uid] as? String ?? ""
        let first_name = documentData[FBKeys.User.first_name] as? String ?? ""
        let last_name = documentData[FBKeys.User.last_name] as? String ?? ""
        let email = documentData[FBKeys.User.email] as? String ?? ""
        
        // Make sure you also initialize any app specific properties if you have them

        
        self.init(uid: uid,
                  first_name: first_name,
                  last_name: last_name,
                  email: email
                  // Dont forget any app specific ones here too
        )
    }
    
    static func dataDictUser(uid: String, first_name: String, last_name: String, email: String) -> [String: Any] {
        var data: [String: Any]
        
        // If first name and last name is not "" this must be a new entry so add all first time data
        if (first_name != "") && (last_name != "") {
            data = [
                FBKeys.User.uid: uid,
                FBKeys.User.first_name: first_name,
                FBKeys.User.last_name: last_name,
                FBKeys.User.email: email
                // Again, include any app specific properties that you want stored on creation
            ]
        } else {
            // This is a subsequent entry so only merge uid and email so as not
            // to overrwrite any other data.
            data = [
                FBKeys.User.uid: uid,
                FBKeys.User.email: email
            ]
        }
        return data
    }
}
