//
//  LoginView.swift
//  CovidVaccinationPassport
//
//  Created by Jonathan Fong on 5/1/21.
//

import SwiftUI

//salmon color
extension Color {
    public static let salmonColor: Color = Color(UIColor(red: 255 / 255 , green: 98 / 255, blue: 87 / 255, alpha: 1))
}

struct LoginView: View {
    @EnvironmentObject var userInfo: UserInfo
    @State var user: UserViewModel = UserViewModel()
    
    @State private var showAlert = false
    @State private var authError: EmailAuthError?
    
    var body: some View {
        
//        NavigationView{
            
            VStack{
                Image("CovidShield")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: UIScreen.main.bounds.height / 3.2)
//                    .offset(y:-80)
                
                Spacer(minLength: 0)
                
                ZStack{
                    
                    VStack{
                        TextField("Email Address", text:self.$user.email)
                            .font(.title)
                            .padding([.leading, .trailing], 30)
//                            .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: 3)
                            .frame(width: 375)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        
                        Spacer()
                            .frame(height: 50)
                        
                        SecureField("Password", text:self.$user.password)
                            .font(.title)
                            .padding([.leading, .trailing], 30)
//                            .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: 3)
                            .frame(width: 375)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        
                        Spacer()
                            .frame(height: 200)
                    }
                    
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.white.ignoresSafeArea(.all, edges: .bottom).clipShape(CustomCorner(corners: [.topLeft, .topRight])).ignoresSafeArea(.all, edges: .bottom))
//                .clipShape(RoundedRectangle(cornerRadius: 20))
//                .offset(y:-50)
                
                //login button
//                Button("Login") {
//                    FBAuth.authenticate(withEmail: self.user.email, password: self.user.password){ (result) in
//                        switch result {
//                        case .failure(let error):
//                            self.authError = error
//                            self.showAlert = true
//                        case .success( _):
//                            print("Signed In")
//                        }
//                    }
////                    self.userInfo.isUserAutheticated = .signedIn
//                }
                
//                NavigationLink(
//                    destination: RegisterView(),
//                    label: {
//                        Text("Sign Up")
//                    })
                
            }
            .background(Color.salmonColor.ignoresSafeArea(.all, edges: .all))
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Login Error"), message: Text(self.authError?.localizedDescription ?? "Unknown Error"), dismissButton: .default(Text("Ok")) {
                    if self.authError == .incorrectPassword {
                        self.user.password = ""
                    } else {
                        self.user.password = ""
                        self.user.email = ""
                    }
                })
            }
            
//            .navigationTitle(Text("Login Page"))

            
//        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView().environmentObject(userInfo)
    }
}
