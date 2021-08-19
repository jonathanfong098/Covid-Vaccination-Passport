// //
////  FBFireStore.swift
////  Signin With Apple
////
////  Created by Stewart Lynch on 2020-03-18.
////  Copyright © 2020 CreaTECH Solutions. All rights reserved.
////
//import SwiftUI
//
//struct currentDate {
//    let date: Date = Date()
//    let dateFormatter: DateFormatter = DateFormatter()
//    var currentDateAsString: String = ""
//    
//    init(){
//        setCurrentDateAsString()
//    }
//    
//    mutating func setCurrentDateAsString() {
//        self.dateFormatter.dateFormat = "MMMM d, yyyy"
//        
//        self.currentDateAsString = self.dateFormatter.string(from: self.date)
//    }
//    
//    func getCurrentDateAsString() -> String {
//        return self.currentDateAsString
//    }
//    
//    static func getCurrentDateAsString() -> String {
//        let newDate: Date = Date()
//        let newDateFormatter: DateFormatter = DateFormatter()
//        
//        newDateFormatter.dateFormat = "MMMM d, yyyy"
//        
//        var newDateAsString: String = newDateFormatter.string(from: newDate )
//        
//        return newDateAsString
//    }
//}
