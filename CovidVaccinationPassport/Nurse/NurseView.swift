////
////  NurseView.swift
////  VaccinePassport
////
////  Created by Samuel Chu on 4/30/21.
////
//
//import SwiftUI
//
////salmon color
////extension Color {
////    public static let salmonColor: Color = Color(UIColor(red: 255 / 255 , green: 110 / 255, blue: 99 / 255, alpha: 1))
////}
//struct NurseView: View {
//    @State var patient: PatientViewModel = PatientViewModel()
//    
//    func haveFirstVaccine(){
//        self.patient.firstVaccineStatus = true
//        print(self.patient.firstVaccineStatus)
//    }
//    
//    func haveSecondVaccine(){
//        self.patient.secondVaccineStatus = true
//        print(self.patient.secondVaccineStatus)
//    }
//    
//    var body: some View {
//        Spacer()
//        
//        VStack {
//            Text("Medical Staff Vaccine Form")
//                .font(.title)
//                .foregroundColor(Color.black)
//                .padding()
//                .offset(y:40)
//            
//            HStack{
//                Text("Patient ID:")
//                    .font(.title3)
//                    .multilineTextAlignment(.leading)
//                    .offset(x:65, y:40)
////                TextField("i.e 4321", text: self.$patient.id)
//                    .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: 3)
//                    .offset(x:131, y:40)
//            }
//                
//            HStack{
//                Text("Patient Name:")
//                    .font(.title3)
//                    .multilineTextAlignment(.leading)
//                    .offset(x:65, y:40)
////                TextField("i.e Jane Doe", text: self.$patient.name).offset(x:100, y:40)
//            }
//            
//          HStack{
//                Text("Patient Age:")
//                    .font(.title3)
//                    .multilineTextAlignment(.leading)
//                    .offset(x:65, y:40)
////                TextField("i.e 42", text: self.$patient.age).offset(x:116, y:40)
//            }
//            
//            HStack{
//                Text("Vaccine Location:")
//                    .font(.title3)
//                    .multilineTextAlignment(.leading)
//                    .offset(x:65, y:40)
////                TextField("i.e Levi's Stadium", text: self.$patient.location).offset(x:68, y:40)
//            }
//        
//            //checkboxes
//            HStack{
//                Button("Button"){
//                    haveSecondVaccine()
//                }
//                Text("Shot 1")
//                Button(action:haveFirstVaccine){
//                    Image(systemName: self.patient.firstVaccineStatus ? "checkmark.square": "square")
//                }
//                Text("Shot 2")
//                Button(action:haveSecondVaccine){
//                    Image(systemName: self.patient.secondVaccineStatus ? "checkmark.square": "square")
//                }
//            }.offset(y:40)
//        
//            Spacer()
//        
//            HStack{
//                Text("By writing your name you confirm that you are responsible for giving this patient a shot of the Covid-19 vaccine.")
//                    .font(.title3)
//                    .multilineTextAlignment(.leading)
//                    .offset(x:65)
//                TextField("Signature", text: self.$patient.nurseSignature).offset(x:68)
//            }
//            
////            Spacer()
//            
////            Button(action: {
////                FBFirestorePatient.buildPatient(id: self.patient.id, name: self.patient.name, age: self.patient.age, location: self.patient.location, nurseSignature: self.patient.nurseSignature , haveFirstVaccine: self.patient.firstVaccineStatus, haveSecondVaccine: self.patient.secondVaccineStatus)
////            }, label: {
////                Text("Button")
////            })
//            
//            Spacer()
//            
//        }.background(Color.lightBlue).ignoresSafeArea()
//            
//    }
//        
//}
//
//
//struct NurseView_Preview: PreviewProvider {
//    static var previews: some View {
//        NurseView()
//    }
//}
