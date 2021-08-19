//
//  CustomCorner.swift
//  CovidVaccinationPassport
//
//  Created by Jonathan Fong on 5/2/21.
//

import SwiftUI

//custom corner for white space on login page
struct CustomCorner: Shape {
    var corners: UIRectCorner
    
    func path(in rect: CGRect) -> Path {
        
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: 30, height: 30))
         
        return Path(path.cgPath)
    }
}
