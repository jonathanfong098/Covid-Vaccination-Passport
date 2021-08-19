//
//  PatientView.swift
//  CovidVaccinationPassport
//
//  Created by Jonathan Fong on 5/6/21.
//

import SwiftUI
import iPhoneNumberField

struct PatientView: View {
    @EnvironmentObject var userInfo: UserInfo
    @State private var vaccineStatusButton = true
    
    @State private var patient: PatientViewModel = PatientViewModel()
    
    @State private var previewIndex = 0
    
    @State private var profileImage: Image?
    @State private var pickedImage: Image?
    @State private var showingActionSheet = false
    @State private var showingImagePicker = false
    @State private var imageData: Data = Data()
    @State private var sourceType: UIImagePickerController.SourceType = .photoLibrary
    func loadImage(){
        guard let inputImage = pickedImage else {
            return
        }
        profileImage = inputImage
    }
    
    @State private var selectedState: String = patientHelper.AmericanState.alabama.rawValue
    
    @State private var selectedGender: String = patientHelper.gender.male.rawValue
    
//    init(){
////        UITableView.appearance().backgroundColor = .clear
//    }
    var body: some View {
        GeometryReader{ geometry in
        VStack{
//            .padding(.bottom, 150)
//        NavigationView {
//            ScrollView(.vertical) {
                Form{
                    HStack{
                        if profileImage != nil {
                            profileImage!.resizable()
                                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                                .frame(width: geometry.size.width / 4, height: geometry.size.height / 8, alignment: .center)
                                .padding([.top, .bottom], geometry.size.height / 80)
                                .padding(.trailing, geometry.size.width / 20)
                                .onTapGesture {
                                    self.showingActionSheet = true
                                }
                        } else {
                            Image(systemName: "person.crop.circle")
                                .resizable()
                                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                                .frame(width: geometry.size.width / 5, height: geometry.size.height / 10, alignment: .center)
                                .padding([.top, .bottom], geometry.size.height / 80)
                                .padding(.trailing, geometry.size.width / 20)
                                .onTapGesture {
                                    self.showingActionSheet = true
                                }
                        }
                        Text("Hi, \(userInfo.user.first_name) !")
                            .font(.system(size: 30, design: .rounded))
                            .fontWeight(.bold)

                    }
                    //personal information
                    Section(header: Text("Personal Information")){
                        Text("UID: \(userInfo.user.uid)")
                        Text("Medical Record Number: \(userInfo.patient.mr)")
                        TextField("First Name", text:self.$patient.first_name)
                        TextField("Last Name", text:self.$patient.last_name)
                        TextField("Birthday", text:self.$patient.birthday)
                        TextField("Age", value:self.$patient.age,formatter: NumberFormatter())
                            .keyboardType(.numberPad)
                        Picker("Gender", selection: $selectedGender) {
                            ForEach(patientHelper.gender.allCases) { gender in
                                Text(gender.rawValue)
                            }
                        }
                    }
                    
                    //contact information
                    Section(header: Text("Address Information")){
                        TextField("Address Line One", text:self.$patient.addressLineOne)
                        TextField("Address Line Two", text:self.$patient.addressLineTwo)
                        TextField("City", text:self.$patient.city)
//                        TextField("State", text:self.$patient.state)
                       
                        Picker("State", selection: $selectedState) {
                            ForEach(patientHelper.AmericanState.allCases) { state in
                                Text(state.rawValue)
                            }
                        }
                        
                        TextField("Zip Code", value:self.$patient.zipCode,formatter: NumberFormatter())
                            .keyboardType(.numberPad)
                        
                        let location: String = "\(patient.addressLineOne), \(patient.addressLineTwo), \(patient.city), \(patient.state), \(String(describing: patient.zipCode))"
                        Text("Full Address: \(location)")
                    }
                    
                    Section(header: Text("Contact Information")){
                        Text("Email: \(userInfo.user.email)")
//                        TextField("Phone Number", text:$patient.phoneNumber)
                        
//                        TextField("Phone Number", value:self.$patient.phoneNumber,formatter: NumberFormatter())
//                            .keyboardType(.numberPad)
                        iPhoneNumberField("Phone Number", text: self.$patient.phoneNumber)
                            .flagHidden(false)
                        
                    }
                    
                    Section(header: Text("Vaccine Information")){
                        Toggle(isOn: self.$userInfo.patient.firstVaccineStatus) {
                            Text("First Vaccine Status")
                        }
                        .disabled(vaccineStatusButton)
                        
                        if (userInfo.patient.firstVaccineStatus) {
                            Text("First Vaccine CID: \(userInfo.patient.firstVaccineCID)")
                        } else {
                            Text("First Vaccine CID: None")
                        }
                        
                        Toggle(isOn: self.$userInfo.patient.secondVaccineStatus) {
                            Text("Has Second Vaccine")
                        }
                        .disabled(vaccineStatusButton)
                        
                        if (userInfo.patient.secondVaccineStatus) {
                            Text("Second Vaccine CID: \(userInfo.patient.secondVaccineCID)")
                        } else {
                            Text("Second Vaccine CID: None")
                        }
                    }
                    
                    Section{
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                            Text("Update")
                        })
                    }
                }
                
//            .navigationBarTitle("Profile")
//        }
        .padding(.bottom, -10)
//            Spacer()
            
//        .background(RadialGradient(gradient: Gradient(colors: [.lightBlue, .darkerBlue]), center: .center, startRadius: 200, endRadius: 400).ignoresSafeArea(.all))
            
            HStack{
                TabViewIcon(userInfo: _userInfo, assignedView: UserInfo.Page.homeView , width: geometry.size.width / 3, height: geometry.size.height / 28, systemIconName: "house.fill", tabName: "Home")
                TabViewIcon(userInfo: _userInfo, assignedView: UserInfo.Page.registerView , width: geometry.size.width / 3, height: geometry.size.height / 28, systemIconName: "rectangle.stack.fill", tabName: "Vaccine Card")
                TabViewIcon(userInfo: _userInfo, assignedView: UserInfo.Page.patientView , width: geometry.size.width / 3, height: geometry.size.height / 28, systemIconName: "person.crop.circle.fill", tabName: "Account")
            }
            .frame(width: geometry.size.width, height: geometry.size.height/7)
            .background(Color.tabBarGrey).shadow(radius: 2)
//            .padding(.top, 0)
        }
        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
        .sheet(isPresented: $showingImagePicker, onDismiss: loadImage) {
            ImagePicker(pickedImage: self.$pickedImage, showImagePicker: self.$showingImagePicker, imageData: self.$imageData)
        }.actionSheet(isPresented: $showingActionSheet)
        {ActionSheet(title: Text("Profile Picture"), buttons: [
                .default(Text("Choose A Photo")){
                    self.sourceType = .photoLibrary
                    self.showingImagePicker = true
                },
                .default(Text("Take A Photo")){
                    self.sourceType = .camera
                    self.showingImagePicker = true
                },
                .cancel()
            ])
            
        }
        
    }
    }

}

struct PatientView_Previews: PreviewProvider {
    static var previews: some View {
        PatientView().environmentObject(userInfo)
    }
}
