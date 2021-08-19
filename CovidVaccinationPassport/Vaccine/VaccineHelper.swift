//
//  VaccineHelper.swift
//  CovidVaccinationPassport
//
//  Created by Jonathan Fong on 5/6/21.
//

import Foundation
import SwiftUI

struct currentDate {
    let date: Date = Date()
    let dateFormatter: DateFormatter = DateFormatter()
    var currentDateAsString: String = ""
    
    init(){
        setCurrentDateAsString()
    }
    
    mutating func setCurrentDateAsString() {
        self.dateFormatter.dateFormat = "MMMM d, yyyy"
        
        self.currentDateAsString = self.dateFormatter.string(from: self.date)
    }
    
    func getCurrentDateAsString() -> String {
        return self.currentDateAsString
    }
    
    static func getCurrentDateAsString() -> String {
        let newDate: Date = Date()
        let newDateFormatter: DateFormatter = DateFormatter()
        
        newDateFormatter.dateFormat = "MMMM d, yyyy"
        
        var newDateAsString: String = newDateFormatter.string(from: newDate )
        
        return newDateAsString
    }
}

enum vaccineManufacturer {
    static let pfizer = "pfizer"
    static let moderna = "moderna"
    
}
