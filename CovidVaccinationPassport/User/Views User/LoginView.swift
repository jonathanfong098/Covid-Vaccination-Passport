//
//  LoginView.swift
//  CovidVaccinationPassport
//
//  Created by Jonathan Fong on 5/1/21.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject var userInfo: UserInfo
    @State var user: UserViewModel = UserViewModel()
    
    @State private var showAlert = false
    @State private var authError: EmailAuthError?
    
    @State private var passwordVisible = false
    
    var body: some View {
        GeometryReader{ geometry in 
            ZStack{
                RadialGradient(gradient: Gradient(colors: [.lightBlue, .darkerBlue]), center: .center, startRadius: 200, endRadius: 400)
                
                VStack{
                    Image("vaccine-login")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: geometry.size.height/3.0)
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                        .offset(y: geometry.size.height/15)
                        .shadow(radius: 40)
                    
                    Spacer()
                        .frame(height: geometry.size.height/10)
                    
                    ZStack{
                        VStack(alignment: .leading){
                            Text("Login")
                                .font(.system(size: 60, design: .rounded))
                                .fontWeight(.bold)
                                .shadow(radius: 5)
                                .padding(.bottom, geometry.size.height / 15)
                                .padding(.leading, geometry.size.width / 12)
//                                .offset(x: geometry.size.width / -4)
                            
                            //email entry
                            TextField("Email Address....", text:self.$user.email)
                                .font(.system(size:30, design: .rounded))
                                .padding([.leading, .trailing], geometry.size.width / 15)
                                .foregroundColor(Color.black)
                                .background(Color.textBoxGrey)
                                .cornerRadius(10.0)
                                .background(RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 8.0))
                                .padding([.leading, .trailing], geometry.size.width / 12)
                                .offset(y: geometry.size.height / -45)
                                .shadow(radius: 4)
                                .padding(.bottom, geometry.size.height / 20)
//                                .animation(Animation.easeOut.delay(1.0))

                            
                            HStack{
                                //password entry
                                VStack{
                                    if self.passwordVisible{
                                        TextField("Password....", text:self.$user.password)
                                            .font(.system(size:30, design: .rounded))
                                            .padding([.leading, .trailing], geometry.size.width / 15)
                                            .foregroundColor(Color.black)
                                            .background(Color.textBoxGrey)
                                            .cornerRadius(10.0)
                                            .background(RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 8.0))
                                            .padding([.leading, .trailing], geometry.size.width / 25)
                                            .offset(x: geometry.size.width / 24, y: geometry.size.height / -45)
                                            .shadow(radius: 4)
                                    } else {
                                        SecureField("Password....", text:self.$user.password)
                                            .font(.system(size:30, design: .rounded))
                                            .padding([.leading, .trailing], geometry.size.width / 15)
                                            .foregroundColor(Color.black)
                                            .background(Color.textBoxGrey)
                                            .cornerRadius(10.0)
                                            .background(RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 8.0))
                                            .padding([.leading, .trailing], geometry.size.width / 25)
                                            .offset(x: geometry.size.width / 24, y: geometry.size.height / -45)
                                            .shadow(radius: 4)
                                    }
                                }
                                
                                //password visible button
                                Button(action: {self.passwordVisible.toggle()})
                                    {Image(systemName: self.passwordVisible ? "eye.fill" : "eye.slash.fill").foregroundColor((self.passwordVisible == true) ? Color.green: Color.secondary)
                                    }
                                .offset(x: geometry.size.width / -10, y: geometry.size.height / -45)
                                .padding([.leading, .trailing, .bottom, .top], 0)
                            }
                            
                            Button(action: {
                                FBAuth.authenticate(withEmail: self.user.email, password: self.user.password){ (result) in
                                    switch result {
                                        case .failure(let error):
                                            self.authError = error
                                            self.showAlert = true
                                        case .success( _):
                                            print("Signed In")
                                        }
                                    }
                                }, label: {
                                Text("Login")
                                    .font(.system(size: 25, weight: .semibold))
                                    .padding([.leading, .trailing], geometry.size.width / 6)
                                    .padding(geometry.size.height / 60)
                                    .background(Color.darkerBlue)
                                    .cornerRadius(20)
                                    .foregroundColor(.white)
                                    .padding(geometry.size.height / 90)
                                    .overlay(RoundedRectangle(cornerRadius: 30).stroke(Color.darkerBlue, lineWidth: 5))
                                    .padding(.top, geometry.size.height / 35)
                                    .padding([.leading, .trailing], geometry.size.width / 5)
                                    
                            })
                            
                            Button(action: {
                                userInfo.currentView = UserInfo.Page.registerView
                            }, label: {
                                Text("Sign Up")
                                    .font(.system(size: 25, weight: .semibold))
                                    .padding([.leading, .trailing], geometry.size.width / 7)
                                    .padding(geometry.size.height / 60)
                                    .background(Color.darkerBlue)
                                    .cornerRadius(20)
                                    .foregroundColor(.white)
                                    .padding(geometry.size.height / 90)
                                    .overlay(RoundedRectangle(cornerRadius: 30).stroke(Color.darkerBlue, lineWidth: 5))
                                    .padding(.top, geometry.size.height / 35)
                                    .padding([.leading, .trailing], geometry.size.width / 5.2)
                            })
//                            .frame(height: 100)
                        }
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.white.ignoresSafeArea(.all, edges: .bottom).clipShape(CustomCorner(corners: [.topLeft, .topRight])).ignoresSafeArea(.all, edges: .bottom))
                    .padding(.bottom, geometry.size.height / 40)
                    
                }
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
            }.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView().environmentObject(userInfo)
    }
}
