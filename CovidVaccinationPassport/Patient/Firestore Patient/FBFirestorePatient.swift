//
//  FBFirestorePatient.swift
//  CovidVaccinationPassport
//
//  Created by Jonathan Fong on 5/5/21.
//

import Foundation
import FirebaseFirestore

enum FBFirestorePatient {
    
    //merge patient
    static func mergeFBPatient(data: [String: Any], uid: String, completion: @escaping (Result<Bool, Error>) -> ()) {
        let reference = Firestore
            .firestore()
            .collection(FBKeys.CollectionPath.patient)
            .document(uid)
        reference.setData(data, merge: true) { (err) in
            if let err = err {
                completion(.failure(err))
                return
            }
            completion(.success(true))
        }
    }
    
    //get document with patient information
    static func getPatientDocument(for reference: DocumentReference, completion: @escaping ((Result<[String: Any], Error>) -> ())) {
        reference.addSnapshotListener{ documentSnapshot, error in
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
    
    //get document with patient information and build an FBPatient
    static func retrieveFBPatient(uid: String, completion: @escaping (Result<FBPatient, Error>) -> ()) {
        let reference = Firestore
            .firestore()
            .collection(FBKeys.CollectionPath.patient)
            .document(uid)
        getPatientDocument(for: reference) { (result) in
            switch result {
                case .success(let documentData):
                    guard let patient = FBPatient(documentData: documentData) else {
                        completion(.failure(FireStoreError.noUser))
                        return
                    }
                completion(.success(patient))
            case .failure(let err):
                completion(.failure(err))
            }
        }
    }
    
    //build patient
    static func buildPatient(uid: String, mr: String, first_name: String, last_name: String, birthday:String, age:Int, gender:String, addressLineOne: String, addressLineTwo: String, city: String, state: String, zipCode: Int, location:String, email: String, phoneNumber: String, firstVaccineCID:String, secondVaccineCID: String, firstVaccineStatus: Bool, secondVaccineStatus: Bool, completionHandler: @escaping (Result<Bool,Error>) -> Void ) {

        let data = FBPatient.dataDictPatient(uid: uid, mr: mr, first_name: first_name, last_name: last_name, birthday: birthday, age: age, gender: gender, addressLineOne: addressLineOne, addressLineTwo: addressLineTwo, city: city, state: state, zipCode: zipCode, location: location, email: email, phoneNumber: phoneNumber, firstVaccineCID: firstVaccineCID, secondVaccineCID: secondVaccineCID, firstVaccineStatus: firstVaccineStatus, secondVaccineStatus: secondVaccineStatus)
        
        let uid: String = data["uid"] as! String

        FBFirestorePatient.mergeFBPatient(data: data, uid: uid) { (result) in
            completionHandler(result)
        }
        completionHandler(.success(true))
    }
}
