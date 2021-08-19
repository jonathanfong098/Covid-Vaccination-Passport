//
//  VaccineView.swift
//  CovidVaccinationPassport
//
//  Created by Jonathan Fong on 5/12/21.
//

import SwiftUI

struct VaccineView: View {
    @State private var vaccine: VaccineViewModel = VaccineViewModel()
    
    var body: some View {
        Form{
            Section(header: Text("patient information")){
                TextField("vid", text:self.$vaccine.vid)
                TextField("uid", text:self.$vaccine.uid)
                TextField("mr", text:self.$vaccine.mr)
                TextField("first name", text:self.$vaccine.first_name)
                TextField("Last Name", text:self.$vaccine.last_name)
                TextField("Birthday", text:self.$vaccine.birthday)
                TextField("Age", value:self.$vaccine.age,formatter: NumberFormatter())
                TextField("Gender", text: self.$vaccine.gender)
            }
            
            Section(header: Text("Shot Information")){
                TextField("productManufacturer", text:self.$vaccine.productManufacturer)
                TextField("lotNumber", text:self.$vaccine.lotNumber)
                TextField("dateOfShot", text:self.$vaccine.dateOfShot)
                Toggle(isOn: $vaccine.firstVaccine) {
                    Text("First vacine")
                }
                Toggle(isOn: $vaccine.secondVaccine) {
                    Text("Second vacine")
                }
            }
            
            //health care information
            Section{
                TextField("healthCareOrClinicSite", text:self.$vaccine.healthCareOrClinicSite)
                TextField("medicalProvdierCode", text:self.$vaccine.medicalProvdierCode)
            }
            
            Section{
                TextField("nurseSignature", text:self.$vaccine.nurseSignature)
            }
            
            Section{
                Button(action: {
                    FBFirestoreVaccine.buildVaccine(vid: self.vaccine.vid, uid: self.vaccine.uid, mr: self.vaccine.mr, first_name: self.vaccine.first_name, last_name: self.vaccine.last_name, birthday: self.vaccine.birthday, age: self.vaccine.age, gender: self.vaccine.gender, productManufacturer: self.vaccine.productManufacturer, lotNumber: self.vaccine.lotNumber, dateOfShot: self.vaccine.dateOfShot, firstVaccine: self.vaccine.firstVaccine, secondVaccine: self.vaccine.secondVaccine, healthCareOrClinicSite: self.vaccine.healthCareOrClinicSite, medicalProvdierCode: self.vaccine.medicalProvdierCode, nurseSignature: self.vaccine.nurseSignature) { result in
                        switch result {
                            case .failure( _):
                                print("did not work ")
//                                self.authError = error
//                                self.showAlert = true
                            case .success( _):
                                print("signed in")
                        }
                    }
                }, label: {
                    Text("Register")
                })
            }
        }
    }
}

struct VaccineView_Previews: PreviewProvider {
    static var previews: some View {
        VaccineView()
    }
}
