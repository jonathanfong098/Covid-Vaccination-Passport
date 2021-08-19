//
//  ContentView.swift
//  CovidVaccinationPassport
//
//  Created by Jonathan Fong on 4/30/21.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var userInfo: UserInfo
    
//    @State private var willMoveToNextScreen = false
    
    var body: some View {
        Group{
            if userInfo.isUserAutheticated == .undefined{
                Text("loading")
            } else if userInfo.isUserAutheticated == .signedOut{
                LoginView()
            } else {
                switch userInfo.currentView {
                case UserInfo.Page.homeView:
                    HomeView()
//                        .transition(AnyTransition.slide)
                case UserInfo.Page.loginView:
                    LoginView()
//                        .transition(AnyTransition.slide)
                case UserInfo.Page.registerView:
                    RegisterView()
//                        .transition(AnyTransition.slide)
                case UserInfo.Page.patientView:
                    PatientView()
//                        .transition(AnyTransition.slide)
                case UserInfo.Page.vaccineView:
                    VaccineView()
                default:
                    HomeView()
                }
            }
        }
        .onAppear{self.userInfo.configureFBStateDidChange()}
//        .navigate(to: HomeView(), when: $userInfo.willMoveToNextScreen)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(userInfo)
    }
}
