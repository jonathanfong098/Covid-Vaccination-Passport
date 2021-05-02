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
    
    @Published var isUserAutheticated: FBAuthState = .signedOut
    @Published var user: FBUser = .init(uid: "", first_name: "", last_name: "", email: "")
    
    var authStateDidChangeListenerHandle: AuthStateDidChangeListenerHandle?
    
    func configureFBStateDidChange() {
        authStateDidChangeListenerHandle = Auth.auth().addStateDidChangeListener({ (_, user) in guard let _ = user else {
                self.isUserAutheticated = .signedOut
                 return
        }
        self.isUserAutheticated = .signedIn
    })
    }
    
}
