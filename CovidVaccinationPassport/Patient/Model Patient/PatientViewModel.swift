//
//  PatientViewModel.swift
//  CovidVaccinationPassport
//
//  Created by Jonathan Fong on 5/2/21.
//

import Foundation
import SwiftUI

struct PatientViewModel {
    //patient information
    var uid: String = ""
    var mr: String = "" //medical record id
    var first_name: String = ""
    var last_name: String = ""
    var birthday: String = ""
    var age: Int?
    var gender: String = ""
    
    //address information
    var addressLineOne: String = ""
    var addressLineTwo: String = ""
    var city: String = ""
    var state: String = ""
    var zipCode: Int?
    var location: String = ""
    
    //contact information
    var email: String = ""
    var phoneNumber: String = ""
    
    //shot information
    var firstVaccineCID:String = "None"
    var secondVaccineCID:String = "None"
    var firstVaccineStatus: Bool = false
    var secondVaccineStatus: Bool = false
    
//    //have vaccine
//    mutating func haveFirstVaccine(){
//        if (firstVaccineStatus && secondVaccineStatus) {
//            self.firstVaccineStatus = true
////            print(self.firstVaccineStatus)
//        }
//    }
//    
//    mutating func haveSecondVaccine(){
//        if (firstVaccineStatus) {
//            self.secondVaccineStatus = true
////            print(self.secondVaccineStatus)
//        }
//    }
}
