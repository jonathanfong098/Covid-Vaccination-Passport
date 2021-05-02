//
//  FBPatient.swift
//  CovidVaccinationPassport
//
//  Created by Jonathan Fong on 5/2/21.
//

import Foundation
import FirebaseFirestore

struct FBPatient {
    
    //data dictionary for patient
    static func dataDict(id: String, name: String, age:String, location: String, nurseSignature: String, haveFirstVaccine: Bool, haveSecondVaccine: Bool) -> [String: Any] {
        var data: [String: Any]
        
        data = [
            FBKeys.Patient.id: id,
            FBKeys.Patient.name: name,
            FBKeys.Patient.age: age,
            FBKeys.Patient.location : location,
            FBKeys.Patient.nurseSignature: nurseSignature,
            FBKeys.Patient.haveFirstVaccine: haveFirstVaccine,
            FBKeys.Patient.haveSecondVaccine: haveSecondVaccine
        ]
        
        return data
    }
    
    //build patient
    static func buildPatient(id: String, name: String, age:String, location:String, nurseSignature: String, haveFirstVaccine: Bool, haveSecondVaccine: Bool) {
        
        let data = FBPatient.dataDict(id: id, name: name, age: age, location: location, nurseSignature: nurseSignature, haveFirstVaccine: haveFirstVaccine, haveSecondVaccine: haveSecondVaccine)
        
        FBPatient.mergeFBUser(data: data, id: id)
    }
    
    //merge patient 
    static func mergeFBUser(data: [String: Any], id:String){
        let db = Firestore.firestore()
        let newDocument = db.collection(FBKeys.CollectionPath.patient).document(id)
        newDocument.setData(data, merge: true)
        
    }
}
