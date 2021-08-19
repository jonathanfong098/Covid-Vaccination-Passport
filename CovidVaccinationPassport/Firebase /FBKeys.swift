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
        static let vaccine = "vaccine"
    }
    
    enum User {
        static let uid = "uid"
        static let first_name = "first_name"
        static let last_name = "last_name"
        static let email = "email"
        
    }
    
    enum Patient {
        static let uid: String = "uid"
        static let first_name: String = "first_name"
        static let last_name: String = "last_name"
        static let birthday: String = "birthday"
        static let age: String = "age"
        static let gender: String = "gender"
        static let mr: String = "mr"
        
        //address
        static let addressLineOne: String = "addressLineOne"
        static let addressLineTwo: String = "addressLineTwo"
        static let city: String = "city"
        static let state: String = "state"
        static let zipCode: String = "zipCode"
        static let location: String = "location"
        
        //contact information
        static let email: String = "email"
        static let phoneNumber: String = "phoneNumber"
        
        //shot information
        static let firstVaccineCID: String = "firstVaccineCID"
        static let secondVaccineCID: String = "secondVaccineCID"
        static let firstVaccineStatus: String = "firstVaccineStatus"
        static let secondVaccineStatus: String = "secondVaccineStatus"
    }
    
    enum Vaccine {
        static let vid: String = "vid"
        
        static let uid: String = "uid"
        static let mr: String = "mr"
        static let first_name: String = "firstName"
        static let last_name: String = "lastName"
        static let birthday: String = "birthday"
        static let age: String = "age"
        static let gender: String = "gender"
        
        //shot information
        static let productManufacturer: String = "productManufacturer"
        static let lotNumber: String = "lotNumber"
        static let dateOfShot: String = "dateOfShot"
        static let firstVaccine: String = "firstVaccine"
        static let secondVaccine: String = "secondVaccine"
        
        // health care information
        static let healthCareOrClinicSite: String = "healthCareOrClinicSite"
        static let medicalProvdierCode: String = "medicalProvdierCode"
        
        static let nurseSignature: String = "nurseSignature"
    }
}
