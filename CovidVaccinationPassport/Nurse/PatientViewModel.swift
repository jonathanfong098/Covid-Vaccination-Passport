//
//  PatientViewModel.swift
//  CovidVaccinationPassport
//
//  Created by Jonathan Fong on 5/2/21.
//

import Foundation

class PatientViewModel {
    //patient information
    var id: String = ""
    var name: String = ""
    var age: String = ""
    var location: String = ""
    var nurseSignature = ""

    var currentDateTime = Date()

//    let dateFormatter = DateFormatter()
//
//    let dateTimeString = dateFormatter.string(from: currentDateTime)
//
//    var date = dateTimeString
    
    //have vaccine
    var firstVaccineStatus = false
    var secondVaccineStatus = false
    
//    func haveFirstVaccine(){
//        self.firstVaccineStatus = true
//        print(self.firstVaccineStatus)
//    }
//    
//    func haveSecondVaccine(){
//        self.secondVaccineStatus = true
//        print(self.secondVaccineStatus)
//    }
}



