//
//  UserInformation.swift
//  CovidVaccinationPassport
//
//  Created by Jonathan Fong on 5/1/21.
//

import Foundation

class UserInfo: ObservableObject {
    enum FBAuthState {
        case undefined
        case signedOut
        case signedIn
    }

    @Published var isUserAutheticated: FBAuthState = .signedOut

    func configureFBStateDidChange() {
        self.isUserAutheticated = .signedOut
//        self. isUserAutheticated = .signedIn
    }

}
