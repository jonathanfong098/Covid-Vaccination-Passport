//
//  FBFirestoreVaccine.swift
//  CovidVaccinationPassport
//
//  Created by Jonathan Fong on 5/12/21.
//

import Foundation
import FirebaseFirestore

enum FBFirestoreVaccine {
    //merge Vaccine
    static func mergeFBVaccine(data: [String: Any], vid: String, uid: String, firstVaccine: Bool, secondVaccine: Bool, completion: @escaping (Result<Bool, Error>) -> ()) {
        let reference_vaccine = Firestore
            .firestore()
            .collection(FBKeys.CollectionPath.vaccine)
            .document(vid)
        reference_vaccine.setData(data, merge: true) { (err) in
            if let err = err {
                completion(.failure(err))
                return
            }
            completion(.success(true))
        }
        
        //update patient data
        let reference_user = Firestore
            .firestore()
            .collection(FBKeys.CollectionPath.patient)
            .document(uid)
        
        if (firstVaccine && !secondVaccine) {
            reference_user.updateData([
                "firstVaccineCID": vid,
                "firstVaccineStatus": true
            ]) { (err) in
                if let err = err {
                    print("Error in updating firstVaccineCID and firstVaccineStatus")
                } else {
                    print("Successfully updated firstVaccineCID and firstVaccineStatus")
                }
            }
        } else if (!firstVaccine && secondVaccine) {
            reference_user.updateData([
                "secondVaccineCID": vid,
                "secondVaccineStatus": true
            ]) {(err) in
                if let err = err {
                    print("Error in updating secondVaccineCID and secondVaccineStatus")
                } else {
                    print("Successfully updated secondVaccineCID and secondVaccineStatus")
                }
            }
        }

    }
    
    //get document with vaccine information
    static func getVaccineDocument(for reference: DocumentReference, completion: @escaping ((Result<[String: Any], Error>) -> ())) {
        reference.addSnapshotListener {documentSnapshot, error in
            guard let document = documentSnapshot else{
                completion(.failure(FireStoreError.noDocumentSnapshot))
                return
            }
            guard let documentData = document.data() else {
                completion(.failure(FireStoreError.noSnapshotData))
                return
            }
            completion(.success(documentData))
        }
    }
    
    //get document with vaccine information and build an FBVaccine
    static func retrieveFBVaccine(vid: String, completion: @escaping (Result<FBVaccine, Error>) -> ()) {
        let reference = Firestore
            .firestore()
            .collection(FBKeys.CollectionPath.vaccine)
            .document(vid)
        getVaccineDocument(for: reference) { (result) in
            switch result {
                case .success(let documentData):
                    guard let vaccine = FBVaccine(documentData: documentData) else {
                        completion(.failure(FireStoreError.noUser))
                        return
                    }
                completion(.success(vaccine))
            case .failure(let err):
                completion(.failure(err))
            }
        }
    }
    
    //build vaccine
    static func buildVaccine(vid: String, uid: String, mr: String, first_name: String, last_name: String, birthday: String, age: Int, gender: String, productManufacturer: String, lotNumber: String, dateOfShot: String, firstVaccine: Bool, secondVaccine: Bool, healthCareOrClinicSite: String, medicalProvdierCode: String, nurseSignature: String, completionHandler: @escaping (Result<Bool,Error>) -> Void ) {

        let data = FBVaccine.dataDictVaccine(vid: vid, uid: uid, mr: mr, first_name: first_name, last_name: last_name, birthday: birthday, age: age, gender: gender, productManufacturer: productManufacturer, lotNumber: lotNumber, dateOfShot: dateOfShot, firstVaccine: firstVaccine, secondVaccine: secondVaccine, healthCareOrClinicSite: healthCareOrClinicSite, medicalProvdierCode: medicalProvdierCode, nurseSignature: nurseSignature)
        
        let vid: String = data["vid"] as! String
        let uid: String = data["uid"] as! String
        let firstVaccine: Bool = data["firstVaccine"] as! Bool
        let secondVaccine: Bool = data["secondVaccine"] as! Bool

        FBFirestoreVaccine.mergeFBVaccine(data: data, vid: vid, uid: uid, firstVaccine: firstVaccine, secondVaccine: secondVaccine) { (result) in
            completionHandler(result)
        }
        completionHandler(.success(true))
    }
    
}
