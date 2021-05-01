//
//  LoginView.swift
//  CovidVaccinationPassport
//
//  Created by Jonathan Fong on 5/1/21.
//

import SwiftUI

struct LoginView: View {
    var body: some View {
        
        VStack{
            Image("CovidShield")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: UIScreen.main.bounds.height / 3.5)
            
            Spacer()
            
            ZStack{
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.white)
        }
        .background(Color.red.ignoresSafeArea(.all, edges: .all))
       
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
