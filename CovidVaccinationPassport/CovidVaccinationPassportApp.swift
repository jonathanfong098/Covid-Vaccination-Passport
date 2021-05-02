//
//  CovidVaccinationPassportApp.swift
//  CovidVaccinationPassport
//
//  Created by Jonathan Fong on 4/30/21.
//

import SwiftUI
import Firebase

var userInfo = UserInfo()

@main
struct CovidVaccinationPassportApp: App {
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(userInfo)
        }
    }
}
