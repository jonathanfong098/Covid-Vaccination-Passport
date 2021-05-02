//
//  HomeView.swift
//  CovidVaccinationPassport
//
//  Created by Jonathan Fong on 4/30/21.
//

import SwiftUI
import Firebase

struct HomeView: View {
    @EnvironmentObject var userInfo: UserInfo
    
    func button_action()
    {
        print("Redirecting to adding vaccine card")
    }
    
    var body: some View {
    
        var status:Bool = true
//        NavigationView{
//            NavigationLink(
//                destination: NurseView(),
//                label: {
//                    Text("Go to nurse view")
//                })
//        }
        
        VStack
        {

            //log out
            Button("Log out"){
                FBAuth.logout{ (result) in print("Logged Out")}
//                self.userInfo.isUserAutheticated = .signedOut
            }
            .onAppear {
                guard let uid = Auth.auth().currentUser?.uid else {
                    return
                }
                FBFirestore.retrieveFBUser(uid: uid) {(result) in
                    switch result {
                    case .failure(let error):
                        print(error.localizedDescription)
                    case .success(let user):
                        self.userInfo.user = user
                    }
                }
            }
            
            //status bar
            HStack
            {
                if (status) {
                    Text("Fully Vaccinated")
                        .font(.system(.largeTitle, design: .rounded))
                        .fontWeight(.bold)
                        .foregroundColor(Color.green)
                        .padding(.leading,10)
                        .padding(.bottom, 60.0)
                    
                    Image("GreenCheckMark")
                        .resizable()
                        .frame(width: 100, height: 100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .padding(.leading, 5.0)
                        .padding(.trailing, 10.0 )
                        .padding(.bottom, 60.0)
                } else {
                    Text("Not Vaccinated")
                        .font(.system(.largeTitle, design: .rounded))
                        .fontWeight(.bold)
                        .foregroundColor(Color.red)
                        .padding(.bottom, 60.0)
                    
                    Image("RedCheckMark")
                        .resizable()
                        .frame(width: 100, height: 100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .padding(.leading, 5.0)
                        .padding(.trailing, -10.0)
                        .padding(.bottom, 60.0)
                }
            }
            
            //Vaccine Passport
            Image("Covid19VaccinationRecordCard")
                .resizable()
//                .padding(.all, -1.0)
                .padding([.leading, .trailing], 15.0)
                .frame(width: 400, height: 300, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .cornerRadius(10)
                .overlay(RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.black, lineWidth: 4)
                            .padding([.leading, .trailing], 15.0))
                .shadow(radius: 5)
            
            //Covid Vaccine Passport Code
            Text("Covid Vaccine Passport Code \(userInfo.user.last_name)")
                .font(.system(.title2, design: .rounded))
                .fontWeight(.regular)
                .padding(.top, 10)
            
            
            //Add Vaccine Passport
            Button(action:button_action){
                Text("Add Vaccine Passport")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .padding(10.0)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(40)
                    .foregroundColor(.white)
                    .padding(10)
                    .overlay(RoundedRectangle(cornerRadius: 40).stroke(Color.blue, lineWidth: 5))
            }
                .padding(.top, 70)
            
            
            //Spacer
            Spacer()
                .frame(height: 100)

        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView().environmentObject(userInfo)
    }
}
