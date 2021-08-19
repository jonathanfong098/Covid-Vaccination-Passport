//
//  FBVaccine.swift
//  CovidVaccinationPassport
//
//  Created by Jonathan Fong on 5/12/21.
//

import Foundation

struct FBVaccine{
    let vid: String
    
    //patient information
    let uid: String
    let mr: String
    let first_name: String
    let last_name: String
    let birthday: String
    let age: Int
    let gender: String
    
    //shot information
    let productManufacturer: String
    let lotNumber: String
    let dateOfShot: String
    let firstVaccine: Bool
    let secondVaccine: Bool
    
    // health care information
    let healthCareOrClinicSite: String
    let medicalProvdierCode: String
    
    let nurseSignature: String
    
    init(vid: String, uid: String, mr: String, first_name: String, last_name: String, birthday: String, age: Int, gender: String, productManufacturer: String, lotNumber: String, dateOfShot: String, firstVaccine: Bool, secondVaccine: Bool, healthCareOrClinicSite: String, medicalProvdierCode: String, nurseSignature: String) {
        self.vid = vid
        
        self.uid = uid
        self.mr = mr
        self.first_name = first_name
        self.last_name = last_name
        self.birthday = birthday
        self.age = age
        self.gender = gender
        
        self.productManufacturer = productManufacturer
        self.lotNumber = lotNumber
        self.dateOfShot = dateOfShot
        self.firstVaccine = firstVaccine
        self.secondVaccine = secondVaccine
        
        self.healthCareOrClinicSite = healthCareOrClinicSite
        self.medicalProvdierCode = medicalProvdierCode
        
        self.nurseSignature = nurseSignature
    }
}

extension FBVaccine{
    init?(documentData: [String : Any]) {
        let vid = documentData[FBKeys.Vaccine.vid] as? String ?? ""
        
        let uid = documentData[FBKeys.Vaccine.uid] as? String ?? ""
        let mr = documentData[FBKeys.Vaccine.mr] as? String ?? ""
        let first_name = documentData[FBKeys.Vaccine.first_name] as? String ?? ""
        let last_name = documentData[FBKeys.Vaccine.last_name] as? String ?? ""
        let birthday = documentData[FBKeys.Vaccine.birthday] as? String ?? ""
        let age = documentData[FBKeys.Vaccine.age] as? Int ?? 0
        let gender = documentData[FBKeys.Vaccine.gender] as? String ?? ""
        
        let productManufacturer = documentData[FBKeys.Vaccine.productManufacturer] as? String ?? ""
        let lotNumber = documentData[FBKeys.Vaccine.lotNumber] as? String ?? ""
        let dateOfShot = documentData[FBKeys.Vaccine.dateOfShot] as? String ?? ""
        let firstVaccine = documentData[FBKeys.Vaccine.firstVaccine] as? Bool ?? false
        let secondVaccine = documentData[FBKeys.Vaccine.secondVaccine] as? Bool ?? false
        
        let healthCareOrClinicSite = documentData[FBKeys.Vaccine.healthCareOrClinicSite] as? String ?? ""
        let medicalProvdierCode = documentData[FBKeys.Vaccine.medicalProvdierCode] as? String ?? ""
        
        let nurseSignature = documentData[FBKeys.Vaccine.nurseSignature] as? String ?? ""
        
        self.init(vid: vid, uid: uid, mr: mr, first_name: first_name, last_name: last_name, birthday: birthday, age: age, gender: gender, productManufacturer: productManufacturer, lotNumber: lotNumber, dateOfShot: dateOfShot, firstVaccine: firstVaccine, secondVaccine: secondVaccine, healthCareOrClinicSite: healthCareOrClinicSite, medicalProvdierCode: medicalProvdierCode, nurseSignature: nurseSignature)
    }
    
    static func dataDictVaccine(vid: String, uid: String, mr: String, first_name: String, last_name: String, birthday: String, age: Int, gender: String, productManufacturer: String, lotNumber: String, dateOfShot: String, firstVaccine: Bool, secondVaccine: Bool, healthCareOrClinicSite: String, medicalProvdierCode: String, nurseSignature: String) -> [String: Any] {
        
        let data: [String: Any]
    
        data = [
            FBKeys.Vaccine.vid: vid,
            FBKeys.Vaccine.uid: uid,
            FBKeys.Vaccine.mr: mr,
            FBKeys.Vaccine.first_name: first_name,
            FBKeys.Vaccine.last_name: last_name,
            FBKeys.Vaccine.birthday : birthday,
            FBKeys.Vaccine.age: age,
            FBKeys.Vaccine.gender: gender,
            FBKeys.Vaccine.productManufacturer: productManufacturer,
            FBKeys.Vaccine.lotNumber: lotNumber,
            FBKeys.Vaccine.dateOfShot: dateOfShot,
            FBKeys.Vaccine.firstVaccine: firstVaccine,
            FBKeys.Vaccine.secondVaccine : secondVaccine,
            FBKeys.Vaccine.healthCareOrClinicSite: healthCareOrClinicSite,
            FBKeys.Vaccine.medicalProvdierCode: medicalProvdierCode,
            FBKeys.Vaccine.nurseSignature: nurseSignature,
        ]
        
        return data
    }
}
