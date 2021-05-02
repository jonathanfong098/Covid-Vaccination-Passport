//
//  ContentView.swift
//  CovidVaccinationPassport
//
//  Created by Jonathan Fong on 4/30/21.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var userInfo: UserInfo
    
    var body: some View {
        Group{
            if userInfo.isUserAutheticated == .undefined{
                Text("loading")
            } else if userInfo.isUserAutheticated == .signedOut{
                LoginView()
            } else {
                HomeView()
            }
        }
        .onAppear{self.userInfo.configureFBStateDidChange()}
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(userInfo)
    }
}
