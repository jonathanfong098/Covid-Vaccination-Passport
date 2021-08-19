//
//  RegisterView.swift
//  CovidVaccinationPassport
//
//  Created by Jonathan Fong on 5/1/21.
//

import SwiftUI

struct RegisterView: View {
    @EnvironmentObject var userInfo: UserInfo
    @State private var user = UserViewModel()
    
    @State private var passwordVisible = false
    @State private var confirmPasswordVisible = false
    var body: some View {
        GeometryReader{ geometry in
            ZStack{
                RadialGradient(gradient: Gradient(colors: [.lightBlue, .darkerBlue]), center: .center, startRadius: 200, endRadius: 400).ignoresSafeArea(.all)
                
                VStack{
                    Image("vaccine-register")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: geometry.size.height/3.5)
                        .shadow(radius: 20)
//                        .animation(Animation.easeOut(duration: 10.0))
                    
                    ZStack{
                        VStack{
                            Group{
                                VStack(alignment: .leading){
                                    //uid
                                    Text("UID: \(user.uid)")
                                        .font(.system(size: 40, design: .rounded))
                                        .fontWeight(.bold)
                                        .padding([.leading, .trailing], geometry.size.width / 15)
//                                        .padding(.top, -45)

//                                        .padding(.top, geometry.size.height / -18)
//                                        .padding([.leading, .trailing], geometry.size.width / 7.1)
//                                        .padding([.top, .bottom], geometry.size.height / 50)
                                        .shadow(radius: 4)
                                    
                                    //fist name entry
                                    TextField("First Name....", text:self.$user.first_name)
//                                        .font(Font.custom("Georgia", size: 25))
                                        .font(.system(size: 25, design: .rounded))
                                        .padding([.leading, .trailing], geometry.size.width / 15)
                                        .foregroundColor(Color.black)
                                        .background(Color.textBoxGrey)
                                        .cornerRadius(10.0)
                                        .background(RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 8.0))
                                        .padding([.leading, .trailing], geometry.size.width / 12)
                                        .padding(.bottom, geometry.size.height / 25)
                                        .shadow(radius: 5)
                                
                                    //last name entry
                                    TextField("Last Name....", text:self.$user.last_name)
//                                        .font(Font.custom("Georgia", size: 25))
                                        .font(.system(size: 25, design: .rounded))
                                        .padding([.leading, .trailing], geometry.size.width/15)
                                        .foregroundColor(Color.black)
                                        .background(Color.textBoxGrey)
                                        .cornerRadius(10.0)
                                        .background(RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 8.0))
                                        .padding([.leading, .trailing], geometry.size.width / 12)
                                        .padding(.bottom, geometry.size.height / 25)
                                        .shadow(radius: 4)

                                    
                                    //email entry
                                    TextField("Email....", text:self.$user.email)
//                                        .font(Font.custom("Georgia", size: 25))
                                        .font(.system(size: 25, design: .rounded))
                                        .padding([.leading, .trailing], geometry.size.width/15)
                                        .foregroundColor(Color.black)
                                        .background(Color.textBoxGrey)
                                        .cornerRadius(10.0)
                                        .background(RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 8.0))
                                        .padding([.leading, .trailing], geometry.size.width / 12)
                                        .padding(.bottom, geometry.size.height / 25)
                                        .shadow(radius: 4)
                                    
                                    HStack{
                                    //password entry
                                        VStack{
                                            if self.passwordVisible{
                                                TextField("Password....", text:self.$user.password)
//                                                    .font(Font.custom("Georgia", size: 25))
                                                    .font(.system(size: 25, design: .rounded))
                                                    .padding([.leading, .trailing], geometry.size.width / 15)
                                                    .foregroundColor(Color.black)
                                                    .background(Color.textBoxGrey)
                                                    .cornerRadius(10.0)
                                                    .background(RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 8.0))
                                                    .padding([.leading, .trailing], geometry.size.width / 25)
                                                    .offset(x: geometry.size.width / 24)
                                                    .shadow(radius: 4)
                                            } else {
                                                SecureField("Password....", text:self.$user.password)
//                                                    .font(Font.custom("Georgia", size: 25))
                                                    .font(.system(size: 25, design: .rounded))
                                                    .padding([.leading, .trailing], geometry.size.width / 15)
                                                    .foregroundColor(Color.black)
                                                    .background(Color.textBoxGrey)
                                                    .cornerRadius(10.0)
                                                    .background(RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 8.0))
                                                    .padding([.leading, .trailing], geometry.size.width / 25)
                                                    .offset(x: geometry.size.width / 24)
                                                    .shadow(radius: 4)
//                                                    .padding([.top, .bottom])
                                            }
                                        }
                                        
                                        Button(action: {self.passwordVisible.toggle()})
                                            {Image(systemName: self.passwordVisible ? "eye.fill" : "eye.slash.fill").foregroundColor((self.passwordVisible == true) ? Color.green: Color.secondary)
                                            }
                                        .offset(x: geometry.size.width / -10)
                                        .padding([.leading, .trailing, .bottom, .top], 0)
                                    }
                                    .padding(.bottom, geometry.size.height / 25)
                                    
                                    HStack{
                                        VStack{
                                            if self.confirmPasswordVisible{
                                            //confirm password entry
                                                TextField("Confirm Password....", text:self.$user.confirm_password)
//                                                    .font(Font.custom("Georgia", size: 25))
                                                    .font(.system(size: 25, design: .rounded))
                                                    .padding([.leading, .trailing], geometry.size.width / 15)
                                                    .foregroundColor(Color.black)
                                                    .background(Color.textBoxGrey)
                                                    .cornerRadius(10.0)
                                                    .background(RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 8.0))
                                                    .padding([.leading, .trailing], geometry.size.width / 25)
                                                    .offset(x: geometry.size.width / 24)
                                                    .shadow(radius: 4)
//                                                    .padding([.top, .bottom])
                                            } else {
                                                SecureField("Confirm Password....", text:self.$user.confirm_password)
//                                                    .font(Font.custom("Georgia", size: 25))
                                                    .font(.system(size: 25, design: .rounded))
                                                    .padding([.leading, .trailing], geometry.size.width / 15)
                                                    .foregroundColor(Color.black)
                                                    .background(Color.textBoxGrey)
                                                    .cornerRadius(10.0)
                                                    .background(RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 8.0))
                                                    .padding([.leading, .trailing], geometry.size.width / 25)
                                                    .offset(x: geometry.size.width / 24)
                                                    .shadow(radius: 4)
//                                                    .padding([.top, .bottom])
                                            }
                                        }
//                                        .padding(.bottom, geometry.size.height / 35)
                                        
                                        Button(action: {self.confirmPasswordVisible.toggle()})
                                            {Image(systemName: self.confirmPasswordVisible ? "eye.fill" : "eye.slash.fill").foregroundColor((self.confirmPasswordVisible == true) ? Color.green: Color.secondary)
                                            }
                                        .offset(x: geometry.size.width / -10)
                                        .padding([.leading, .trailing, .bottom, .top], 0)
                                    }
                                }
                                .padding(.bottom, geometry.size.height / 40)
                            }
                            
                            Button(action: {
                                FBAuth.buildUser(withEmail: self.user.email, uid: self.user.uid, first_name: self.user.first_name, last_name: self.user.last_name, password: self.user.password) { (result) in
                                    switch result{
                                        case(.failure(let error)):
                                            print(error.localizedDescription)
                                        case .success(_):
                                            print("Account built successfully")
                                    }
                                }
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
                                    .padding(.top, geometry.size.height / 50)
                                    .padding([.leading, .trailing], geometry.size.width / 5.2)
                            })
                        }
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .padding(.top)
                    .background(Color.white.ignoresSafeArea(.all, edges: .bottom).clipShape(CustomCorner(corners: [.topLeft, .topRight])).ignoresSafeArea(.all, edges: .bottom))

            }
            }
        }
    }

}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView().environmentObject(userInfo)
    }
}
