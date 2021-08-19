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
    
//    @State private var status:Bool = userInfo.patient.firstVaccineStatus
    
    var body: some View {
        GeometryReader{ geometry in
            ZStack{
//                RadialGradient(gradient: Gradient(colors: [.lightBlue, .darkerBlue]), center: .center, startRadius: 200, endRadius: 400).ignoresSafeArea(.all)
                
                VStack{
//                    NavigationBarView()
//                        .padding(.top, 40)
//                        .padding(.trailing)
                    Spacer()
                        .frame(height: geometry.size.height / 10)
                    VStack{
                        if (userInfo.patient.firstVaccineStatus && !userInfo.patient.secondVaccineStatus){
                            Text("Single Vaccinated")
                                .font(.system(size:40))
                                .fontWeight(.bold)
                                .foregroundColor(Color.green)
                                .padding([.leading, .trailing], geometry.size.width / -13)
                        } else if (userInfo.patient.firstVaccineStatus && userInfo.patient.secondVaccineStatus) {
                            Text("Double Vaccinated")
                                .font(.system(size:40))
                                .fontWeight(.bold)
                                .foregroundColor(Color.green)
                                .padding([.leading, .trailing], geometry.size.width / -12)
                        } else {
                            Text("Not Vaccinated")
                                .font(.system(size:40))
                                .fontWeight(.bold)
                                .foregroundColor(Color.red)
                        }
                        
                    }
                    .padding([.leading, .trailing], geometry.size.width / 12)
                    .padding(geometry.size.height / 50)
                    .background(Color.textBoxGrey)
                    .cornerRadius(15)
                    
//                    Text("\(userInfo.patient.firstVaccineCID)")
//                    Text("\(userInfo.firstVaccine.vid)")
//                    Text("\(userInfo.secondVacine.vid)")
                    
//                    CardView()
                    
                    Spacer()
                    HStack{
                        TabViewIcon(userInfo: _userInfo, assignedView: UserInfo.Page.homeView , width: geometry.size.width / 3, height: geometry.size.height / 28, systemIconName: "house.fill", tabName: "Home")
                        TabViewIcon(userInfo: _userInfo, assignedView: UserInfo.Page.vaccineView , width: geometry.size.width / 3, height: geometry.size.height / 28, systemIconName: "rectangle.stack.fill", tabName: "Vaccine Card")
                        TabViewIcon(userInfo: _userInfo, assignedView: UserInfo.Page.patientView , width: geometry.size.width / 3, height: geometry.size.height / 28, systemIconName: "person.crop.circle.fill", tabName: "Account")
                    }
                    .frame(width: geometry.size.width, height: geometry.size.height/7)
                    .background(Color.tabBarGrey).shadow(radius: 2)
                    .padding(.top, 0)
                }
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            }
        }
    }
}

struct TabViewIcon: View {
    @EnvironmentObject var userInfo: UserInfo
    let assignedView: UserInfo.Page
    
    let width: CGFloat
    let height: CGFloat
    let systemIconName: String
    let tabName: String
    
    var body: some View {
        VStack {
            Image(systemName: systemIconName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: width, height: height)
                .padding(.top, 10)
            Text(tabName)
                .font(.system(.subheadline, design: .rounded))
            Spacer()
                .frame(width: width, height: height)
        }
        .padding(.horizontal, -4)
        
        .onTapGesture {
            withAnimation{
                userInfo.currentView = assignedView
            }
        }
        .foregroundColor(userInfo.currentView == assignedView ? Color("TabBarHighlight") : .gray)
    }
}

//struct NavigationBarView: View {
//    var body: some View{
//        HStack{
//            Image("CDCLogo2")
//                .resizable()
//                .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
//                .frame(width: 30, height:30, alignment: .trailing)
//        }
//    }
//}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView().environmentObject(userInfo)
    }
}


