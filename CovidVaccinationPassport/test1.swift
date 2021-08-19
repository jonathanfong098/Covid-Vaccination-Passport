//
//  test1.swift
//  CovidVaccinationPassport
//
//  Created by Jonathan Fong on 5/5/21.
//

import SwiftUI
import PassLibrarySUI

struct test1: View {
    @EnvironmentObject var userInfo: UserInfo
    
    @ObservedObject private var pkPassHandler = AddPKPassHandler()
    
    var body: some View {
        VStack {
            Image("VaccineCard")
                    Button(action: {
                        guard let passUrl = URL(string: "https://<PKPASS_URL>.pkpass") else { return }
                        do {
                            try pkPassHandler.openPKPass(from: passUrl)
                        } catch {
                            // Handle error accordingly
                        }
                    }) {
                        Text("Open remote pk pass")
                    }
                    Button(action: {
                        guard let filePath = Bundle.main.path(forResource: "VaccineCard", ofType: "pkpass") else { return }
                        let passUrl = URL(fileURLWithPath: filePath)
                        do {
                            try pkPassHandler.openPKPass(from: passUrl)
                        } catch {
                            // Handle error accordingly
                        }
                    }) {
                        Text("Open local pk pass")
                    }
                }
                .addPKPassSheet(isShowing: $pkPassHandler.showAddPassView, pass: pkPassHandler.pass)
            
        
//        GeometryReader{geometry in
//            Image("CardBackground5")
//                .resizable()
//                .cornerRadius(20)
//                .frame(width: 380, height: 250, alignment: .center)
//                .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.black, lineWidth:5))
//        }
//        CardView()
            
        
//        Text("text")
//        GeometryReader{ geometry in
//            ZStack{
//                RadialGradient(gradient: Gradient(colors: [.lightBlue, .darkerBlue]), center: .center, startRadius: 200, endRadius: 400).ignoresSafeArea(.all)
//
//                VStack{
//                    Spacer()
//                    Text("hi")
//                    Spacer()
//                    HStack{
//                        TabViewIcon(userInfo: _userInfo, assignedView: UserInfo.Page.homeView , width: geometry.size.width / 3, height: geometry.size.height / 28, systemIconName: "house.fill", tabName: "Home")
//                        TabViewIcon(userInfo: _userInfo, assignedView: UserInfo.Page.homeView , width: geometry.size.width / 3, height: geometry.size.height / 28, systemIconName: "rectangle.stack.fill", tabName: "Vaccine Card")
//                        TabViewIcon(userInfo: _userInfo, assignedView: UserInfo.Page.registerView , width: geometry.size.width / 3, height: geometry.size.height / 28, systemIconName: "person.crop.circle.fill", tabName: "Profile")
//                    }
//                    .frame(width: geometry.size.width, height: geometry.size.height/8)
//                    .background(Color.textBoxGrey).shadow(radius: 2)
//
//                }
//                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
//            }
//
//        }
        
    }
}

struct test1_Preview: PreviewProvider {
    static var previews: some View {
        test1().environmentObject(userInfo)
    }
}

struct CardView: View {
    @EnvironmentObject var userInfo: UserInfo
    
    var firstVaccine: Bool = false
        
    var body: some View{
        GeometryReader{geometry in
            ZStack{
                RadialGradient(gradient: Gradient(colors: [.darkerBlue, .lightBlue]), center: .center, startRadius: 100, endRadius: 400).ignoresSafeArea(.all)
            }
            .frame(width: geometry.size.width / 1.1, height: geometry.size.width / 1.8, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .cornerRadius(20)
            .padding()
            .overlay(
                VStack(alignment: .leading){
                    HStack{
                        Text("Vaccination Passport")
                            .font(.system(size: 30, design: .rounded))
                            .fontWeight(.bold)

                    
                    }
                    
                    HStack{
                        Text("Jonathan Fong")
                    }
                    
                    HStack{
                        Text("First Vaccine")
                        if userInfo.patient.firstVaccineStatus{
                            Image(systemName: "checkmark.square.fill")
                        } else {
                            Image(systemName: "xmark.square.fill")
                        }
                        
                        Text("Second Vaccine")
//                        Text("Date: March 21, 2020")
                        if userInfo.patient.firstVaccineStatus{
                        }
                        Image(systemName: "checkmark.square.fill")
                    }
                    
                    
//                    HStack{
//                        Text("Second Vaccine")
////                        Text("Date: March 21, 2020")
//                        Image(systemName: "checkmark.square.fill")
//                    }
                    
                    VStack{
                        Text("Issued")
                            .padding(.bottom, 5)
                        Text("Expires")
                    }
                    .offset(x:40, y:105)
                    
//                    .padding(.trailing,3)
                    
                    HStack{
                        Spacer()
                        Image("Logo")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 150, height: 150, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
//                            .padding(-20)
                            .padding(.trailing, 20)
//                            .padding(.top,)
                    }
        }
            )
    }
}


//struct TabViewIcon: View {
//    @EnvironmentObject var userInfo: UserInfo
//    let assignedView: UserInfo.Page
//    
//    let width: CGFloat
//    let height: CGFloat
//    let systemIconName: String
//    let tabName: String
//    
//    var body: some View {
//        VStack {
//            Image(systemName: systemIconName)
//                .resizable()
//                .aspectRatio(contentMode: .fit)
//                //Since we have five icons, we want everyone to be one-fifth of the ContentView's width
//                .frame(width: width, height: height)
//                .padding(.top, 10)
//            Text(tabName)
//                .font(.system(.subheadline, design: .rounded))
//            Spacer()
//                .frame(width: width, height: height/2)
//        }
//        .padding(.horizontal, -4)
//        .onTapGesture {
//            userInfo.currentView = assignedView
//        }
//    }
//}


//
//  HomeView.swift
//  CovidVaccinationPassport
//
//  Created by Jonathan Fong on 4/30/21.
//
//
//import SwiftUI
//import Firebase

//struct HomeView: View {
//    @EnvironmentObject var userInfo: UserInfo
//
////    @State private var willMoveToNextScreen = false
//
//    var body: some View {
//
//        var status:Bool = true
////        NavigationView{
////            NavigationLink(
////                destination: NurseView(),
////                label: {
////                    Text("Go to nurse view")
////                })
////        }
//
//        VStack
//        {
//
//            //log out
//            Button("Log out"){
//                FBAuth.logout{ (result) in print("Logged Out")}
////                self.userInfo.isUserAutheticated = .signedOut
//            }
//            .onAppear {
//                guard let uid = Auth.auth().currentUser?.uid else {
//                    return
//                }
//                FBFirestore.retrieveFBUser(uid: uid) {(result) in
//                    switch result {
//                    case .failure(let error):
//                        print(error.localizedDescription)
//                    case .success(let user):
//                        self.userInfo.user = user
//                    }
//                }
//            }
//
//            //status bar
//            HStack
//            {
//                if (status) {
//                    Text("Fully Vaccinated")
//                        .font(.system(.largeTitle, design: .rounded))
//                        .fontWeight(.bold)
//                        .foregroundColor(Color.green)
//                        .padding(.leading,10)
//                        .padding(.bottom, 60.0)
//
//                    Image("GreenCheckMark")
//                        .resizable()
//                        .frame(width: 100, height: 100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
//                        .padding(.leading, 5.0)
//                        .padding(.trailing, 10.0 )
//                        .padding(.bottom, 60.0)
//                } else {
//                    Text("Not Vaccinated")
//                        .font(.system(.largeTitle, design: .rounded))
//                        .fontWeight(.bold)
//                        .foregroundColor(Color.red)
//                        .padding(.bottom, 60.0)
//
//                    Image("RedCheckMark")
//                        .resizable()
//                        .frame(width: 100, height: 100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
//                        .padding(.leading, 5.0)
//                        .padding(.trailing, -10.0)
//                        .padding(.bottom, 60.0)
//                }
//            }
//
//            //Vaccine Passport
//            Image("Covid19VaccinationRecordCard")
//                .resizable()
////                .padding(.all, -1.0)
//                .padding([.leading, .trailing], 15.0)
//                .frame(width: 400, height: 300, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
//                .cornerRadius(10)
//                .overlay(RoundedRectangle(cornerRadius: 10)
//                            .stroke(Color.black, lineWidth: 4)
//                            .padding([.leading, .trailing], 15.0))
//                .shadow(radius: 5)
//
//            //Covid Vaccine Passport Code
//            Text("\(userInfo.user.uid)")
//                .font(.system(.title2, design: .rounded))
//                .fontWeight(.regular)
//                .padding(.top, 10)
//
//
//            //Add Vaccine Passport
//            Button(action: {
//                withAnimation {
//                    userInfo.currentView = UserInfo.Page.registerView
//                }
//            }){
//                Text("Add Vaccine Passport")
//                    .font(.subheadline)
//                    .fontWeight(.semibold)
//                    .padding(10.0)
//                    .padding()
//                    .background(Color.blue)
//                    .cornerRadius(40)
//                    .foregroundColor(.white)
//                    .padding(10)
//                    .overlay(RoundedRectangle(cornerRadius: 40).stroke(Color.blue, lineWidth: 5))
//            }
//                .padding(.top, 70)
//
//
//            //Spacer
//            Spacer()
//                .frame(height: 100)
//
//        }
////        .navigate(to: RegisterView(), when: $willMoveToNextScreen)
//    }
//}
//
//struct HomeView_Previews: PreviewProvider {
//    static var previews: some View {
//        HomeView().environmentObject(userInfo)
//    }
//}
}
