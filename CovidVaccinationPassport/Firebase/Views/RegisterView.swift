//
//  RegisterView.swift
//  CovidVaccinationPassport
//
//  Created by Jonathan Fong on 5/1/21.
//

import SwiftUI

struct RegisterView: View {
    @EnvironmentObject var userInfo: UserInfo
    @State var user: UserViewModel = UserViewModel()
    @State private var showError = false
    @State private var errorString = ""
    
    var body: some View {
        
        NavigationView {
            VStack{
                Group{
                    VStack {
                        TextField("First Name", text: self.$user.first_name)
                        if !user.valid_first_name_message.isEmpty{
                            Text(user.valid_first_name_message)
                                .foregroundColor(Color.red)
                                .multilineTextAlignment(.center)
                        }
                    }
                    
                    VStack {
                        TextField("Last Name", text: self.$user.last_name)
                        if !user.valid_last_name_message.isEmpty{
                            Text(user.valid_last_name_message)
                                .foregroundColor(Color.red)
                                .multilineTextAlignment(.center)
                        }
                    }
                    
                    VStack{
                        TextField("Email Address", text: self.$user.email)
                        if !user.valid_email_address_message.isEmpty{
                            Text(user.valid_email_address_message)
                                .foregroundColor(Color.red)
                                .multilineTextAlignment(.center)
                        }
                    }
                    
                    VStack{
                        TextField("Password", text: self.$user.password)
                        if !user.valid_password_message.isEmpty{
                            Text(user.valid_password_message)
                                .foregroundColor(Color.red)
                                .multilineTextAlignment(.center)
                        }
                    }
                    
                    VStack{
                        TextField("Confirm Password", text: self.$user.confirm_password)
                        if !user.valid_password_message.isEmpty{
                            Text(user.valid_password_message)
                                .foregroundColor(Color.red)
                                .multilineTextAlignment(.center)
                        }
                    }
                }
                
                Button(action: {
                    FBAuth.createUser(withEmail: self.user.email, first_name: self.user.first_name, last_name: self.user.last_name, password: self.user.password) {(result) in
                        switch result {
                        case .failure(let error):
                            self.errorString = error.localizedDescription
                            self.showError = true
                        case .success( _):
                            print("Account creation successful")
                        }
                    }
                }){
                    Text("Register")
                }

                .disabled(!user.register_complete)
            }
            .alert(isPresented: $showError) {
                Alert(title: Text("Error creating account"), message: Text(self.errorString), dismissButton: .default(Text("Ok")))
            }
            
        }
            
//            .navigationTitle(Text("Register Page"))
//            .navigationBarItems(trailing: NavigationLink(
//                                    destination: LoginView(),
//                                    label: {
//                                        Text("Return to Login Page")
//                                    }))
    }
}


struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView().environmentObject(userInfo)
    }
}
