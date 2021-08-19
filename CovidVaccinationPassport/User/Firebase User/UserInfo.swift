//
//  UserInfo.swift
//  CovidVaccinationPassport
//
//  Created by Jonathan Fong on 5/1/21.
//

import Foundation
import FirebaseAuth

class UserInfo: ObservableObject {
    enum FBAuthState {
        case undefined
        case signedOut
        case signedIn
    }
    
    enum Page {
        case homeView
        case loginView
        case registerView
        case patientView
        case vaccineView
    }
    
    @Published var currentView: Page = .homeView

    //initially signed out
    @Published var isUserAutheticated: FBAuthState = .signedOut
    
    // initiate FBUser
    @Published var user: FBUser = .init(uid: "", first_name: "", last_name: "", email: "")
    
    // initiate FBPatient
    @Published var patient: FBPatient = .init(uid: "", mr: "", first_name: "", last_name: "", birthday: "", age: 0, gender: "", addressLineOne: "", addressLineTwo: "", city: "", state: "", zipCode: 0, location: "", email: "", phoneNumber: "", firstVaccineCID: "", secondVaccineCID: "", firstVaccineStatus: false, secondVaccineStatus: false)
    
    //initiate FBVaccine
    @Published var firstVaccine: FBVaccine = .init(vid: "", uid: "", mr: "", first_name: "", last_name: "", birthday: "", age: 0, gender: "", productManufacturer: "", lotNumber: "", dateOfShot: "", firstVaccine: false, secondVaccine: false, healthCareOrClinicSite: "", medicalProvdierCode: "", nurseSignature: "")
    
    //initiate FBVaccine
    @Published var secondVacine: FBVaccine = .init(vid: "", uid: "", mr: "", first_name: "", last_name: "", birthday: "", age: 0, gender: "", productManufacturer: "", lotNumber: "", dateOfShot: "", firstVaccine: false, secondVaccine: false, healthCareOrClinicSite: "", medicalProvdierCode: "", nurseSignature: "")
    
//    @Published var willMoveToNextScreen = false
    
    var authStateDidChangeListenerHandle: AuthStateDidChangeListenerHandle?
    
    func configureFBStateDidChange() {
        //sign in
        authStateDidChangeListenerHandle = Auth.auth().addStateDidChangeListener({ (_, user) in
            guard let _ = user else {
                self.isUserAutheticated = .signedOut
                return
            }
            self.isUserAutheticated = .signedIn
            
            //get FBUser
            FBFirestore.retrieveFBUser(uid: user!.uid) { (result) in
                switch result {
                case .failure(let error):
                    print(error.localizedDescription)
                case .success(let user):
                    self.user = user
                }
            }
            
            //get FBPatient and get FBVaccine
            FBFirestorePatient.retrieveFBPatient(uid: user!.uid) { (result) in
                switch result {
                    case .failure(let error):
                        print(error.localizedDescription)
                    case .success(let patient):
                        self.patient = patient
                        
                        if (self.patient.firstVaccineStatus) {
                            FBFirestoreVaccine.retrieveFBVaccine(vid: self.patient.firstVaccineCID) { (result) in
                                switch result{
                                    case .failure(let error):
                                        print(error.localizedDescription)
                                    case .success(let firstVaccine):
                                        self.firstVaccine = firstVaccine
                                }
                            }
                        }
                        
                        if (self.patient.secondVaccineStatus) {
                            FBFirestoreVaccine.retrieveFBVaccine(vid: self.patient.secondVaccineCID) { (result) in
                                switch result{
                                    case .failure(let error):
                                        print(error.localizedDescription)
                                case .success(let secondVaccine):
                                    self.secondVacine = secondVaccine
                                }
                            }
                        }
                }
            }
            
            
            
//            self.willMoveToNextScreen = true

        })
    }
    
    
    
}
