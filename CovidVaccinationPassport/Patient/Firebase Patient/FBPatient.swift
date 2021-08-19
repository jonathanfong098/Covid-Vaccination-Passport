//
//  FBPatient.swift
//  CovidVaccinationPassport
//
//  Created by Jonathan Fong on 5/2/21.
//

import Foundation

struct FBPatient {
    //personal information
    let uid: String
    let mr: String //medical record id
    let first_name: String
    let last_name: String
    let birthday: String
    let age: Int
    let gender: String
    
    //address information
    let addressLineOne: String
    let addressLineTwo: String
    let city: String
    let state: String
    let zipCode: Int
    let location: String
    
    //contact information
    let email: String
    let phoneNumber: String
    
    //shot information
//    var firstVaccineCID: String = "None"
    var firstVaccineCID:String = ""
    var secondVaccineCID:String = ""
    var firstVaccineStatus: Bool
    var secondVaccineStatus: Bool
    
    init(uid: String, mr:String, first_name: String, last_name: String, birthday:String, age:Int, gender:String, addressLineOne: String, addressLineTwo: String, city: String, state: String, zipCode: Int, location:String, email: String, phoneNumber: String, firstVaccineCID:String, secondVaccineCID: String, firstVaccineStatus: Bool, secondVaccineStatus: Bool) {
        self.uid = uid
        self.mr = mr //medical record id
        self.first_name = first_name
        self.last_name = last_name
        self.birthday = birthday
        self.age = age
        self.gender = gender
        
        self.addressLineOne = addressLineOne
        self.addressLineTwo = addressLineTwo
        self.city = city
        self.state = state
        self.zipCode = zipCode
        self.location = location
        
        self.email = email
        self.phoneNumber = phoneNumber
        
        self.firstVaccineCID = firstVaccineCID
        self.secondVaccineCID = secondVaccineCID
        self.firstVaccineStatus = firstVaccineStatus
        self.secondVaccineStatus = secondVaccineStatus
    }
}

extension FBPatient {
    init?(documentData: [String : Any]) {
        let uid = documentData[FBKeys.Patient.uid] as? String ?? ""
        let mr = documentData[FBKeys.Patient.mr] as? String ?? ""
        let first_name = documentData[FBKeys.Patient.first_name] as? String ?? ""
        let last_name = documentData[FBKeys.Patient.last_name] as? String ?? ""
        let birthday = documentData[FBKeys.Patient.birthday] as? String ?? ""
        let age = documentData[FBKeys.Patient.age] as? Int ?? 0
        let gender = documentData[FBKeys.Patient.gender] as? String ?? ""
        let addressLineOne = documentData[FBKeys.Patient.addressLineOne] as? String ?? ""
        let addressLineTwo = documentData[FBKeys.Patient.addressLineTwo] as? String ?? ""
        let city = documentData[FBKeys.Patient.city] as? String ?? ""
        let state = documentData[FBKeys.Patient.state] as? String ?? ""
        let zipCode = documentData[FBKeys.Patient.zipCode] as? Int ?? 0
        let location = documentData[FBKeys.Patient.location] as? String ?? ""
        let email = documentData[FBKeys.Patient.email] as? String ?? ""
        let phoneNumber = documentData[FBKeys.Patient.phoneNumber] as? String ?? ""
        let firstVaccineCID = documentData[FBKeys.Patient.firstVaccineCID] as? String ?? ""
        let secondVaccineCID = documentData[FBKeys.Patient.secondVaccineCID] as? String ?? ""
        let firstVaccineStatus = documentData[FBKeys.Patient.firstVaccineStatus] as? Bool ?? false
        let secondVaccineStatus = documentData[FBKeys.Patient.secondVaccineStatus] as? Bool ?? false


        self.init(uid: uid, mr: mr, first_name: first_name, last_name: last_name, birthday: birthday, age: age, gender: gender, addressLineOne: addressLineOne, addressLineTwo: addressLineTwo, city: city, state: state, zipCode: zipCode, location: location, email: email, phoneNumber: phoneNumber, firstVaccineCID: firstVaccineCID, secondVaccineCID: secondVaccineCID, firstVaccineStatus: firstVaccineStatus, secondVaccineStatus: secondVaccineStatus)
    }
    
    //data dictionary for patient
    static func dataDictPatient(uid: String, mr:String, first_name: String, last_name: String, birthday:String, age:Int, gender:String, addressLineOne: String, addressLineTwo: String, city: String, state: String, zipCode: Int, location:String, email: String, phoneNumber: String, firstVaccineCID:String, secondVaccineCID: String, firstVaccineStatus: Bool, secondVaccineStatus: Bool) -> [String: Any] {
        let data: [String: Any]
        
        data = [
            FBKeys.Patient.uid: uid,
            FBKeys.Patient.mr: mr,
            FBKeys.Patient.first_name: first_name,
            FBKeys.Patient.last_name: last_name,
            FBKeys.Patient.birthday : birthday,
            FBKeys.Patient.age: age,
            FBKeys.Patient.gender: gender,
            FBKeys.Patient.addressLineOne: addressLineOne,
            FBKeys.Patient.addressLineTwo: addressLineTwo,
            FBKeys.Patient.city: city,
            FBKeys.Patient.state: state,
            FBKeys.Patient.zipCode : zipCode,
            FBKeys.Patient.location: location,
            FBKeys.Patient.email: email,
            FBKeys.Patient.phoneNumber: phoneNumber,
            FBKeys.Patient.firstVaccineCID: firstVaccineCID,
            FBKeys.Patient.secondVaccineCID: secondVaccineCID,
            FBKeys.Patient.firstVaccineStatus: firstVaccineStatus,
            FBKeys.Patient.secondVaccineStatus: secondVaccineStatus,
        ]
        
        return data
    }
}
