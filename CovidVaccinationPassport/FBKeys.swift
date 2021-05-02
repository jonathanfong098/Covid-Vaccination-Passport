//
//  FBKeys.swift
//  Signin With Apple
//
//  Created by Stewart Lynch on 2020-03-18.
//  Copyright © 2020 CreaTECH Solutions. All rights reserved.
//

import Foundation
enum FBKeys {
    
    enum CollectionPath {
        static let users = "users"
        static let patient = "patient"
    }
    
    enum User {
        static let uid = "uid"
        static let first_name = "first_name"
        static let last_name = "last name"
        static let email = "email"
        
    }
    
    enum Patient {
        static let id = "id"
        static let name = "name"
        static let age = "age"
        static let location = "location "
        static let nurseSignature = "nurse_signature"
        static let haveFirstVaccine = "have_first_vaccine"
        static let haveSecondVaccine = "have_second_vaccine name"
    }
}
