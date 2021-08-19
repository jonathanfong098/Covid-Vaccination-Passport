//
//  ViewRouter.swift
//  CovidVaccinationPassport
//
//  Created by Jonathan Fong on 5/10/21.
//

import Foundation

import SwiftUI

class ViewRouter: ObservableObject {
    
    @Published var currentPage: Page = .loginView
    
}
