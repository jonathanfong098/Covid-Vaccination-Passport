//
//  VaccineViewModel.swift
//  CovidVaccinationPassport
//
//  Created by Jonathan Fong on 5/6/21.
//

import Foundation

class VaccineViewModel {
    var vid: String = ""
    
    //patient information
    var uid: String = ""
    var mr: String = ""
    var first_name: String = ""
    var last_name: String = ""
    var birthday: String = ""
    var age: Int = 0
    var gender: String = ""
    
    //shot information
    var productManufacturer: String = ""
    var lotNumber: String = ""
    var dateOfShot: String = ""
    var firstVaccine: Bool = false
    var secondVaccine: Bool = false
    
    // health care information
    var healthCareOrClinicSite: String = ""
    var medicalProvdierCode: String = ""
    
    var nurseSignature: String = ""
    
//    //identify if first or second vaccine
//    func isFirstVaccine(){
//        self.firstVaccine = true
//        self.secondVaccine = false
//    }
//
//    func isSecondVaccine(){
//        self.firstVaccine = false
//        self.secondVaccine = false
//    }
}


