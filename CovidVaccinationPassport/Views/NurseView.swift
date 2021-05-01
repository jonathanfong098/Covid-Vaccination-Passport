//
//  NurseView.swift
//  VaccinePassport
//
//  Created by Samuel Chu on 4/30/21.
//

import SwiftUI

extension Color {
    static let lightRed = Color(red: 217 / 255, green: 171 / 255, blue: 171 / 255)
    static let salmon = Color(red: 247 / 255, green: 178 / 255, blue: 178 / 255)
}
struct NurseView: View {
    @State private var name = ""
    @State private var age = ""
    @State private var location = ""
    @State private var nurseSignature = ""
    @State private var date = Date()
    @State private var isChecked1 = false
    @State private var isChecked2 = false
    func toggle1(){
        isChecked1 = !isChecked1
    }
    func toggle2(){
        isChecked2 = !isChecked2
    }
    var body: some View {
        VStack {
            Text("Medical Staff Vaccine Form")
                .font(.title)
                .foregroundColor(Color.black)
                .padding()
                .offset(y:40)
                
            HStack{
                Text("Patient Name:")
                    .font(.title3)
                    .multilineTextAlignment(.leading)
                    .offset(x:65, y:40)
                TextField("Jane Doe", text: $name).offset(x:100, y:40)
            }
            HStack{
                Text("Patient Age:")
                    .font(.title3)
                    .multilineTextAlignment(.leading)
                    .offset(x:65, y:40)
                TextField("42", text: $age).offset(x:116, y:40)
            }
            HStack{
                Text("Vaccine Location:")
                    .font(.title3)
                    .multilineTextAlignment(.leading)
                    .offset(x:65, y:40)
                TextField("Levi's Stadium", text: $location).offset(x:68, y:40)
            }
            //checkboxes
            HStack{
                Text("Shot 1")
                Button(action:toggle1){
                    Image(systemName: isChecked1 ? "checkmark.square": "square")
                }
                Text("Shot 2")
                Button(action:toggle2){
                    Image(systemName: isChecked2 ? "checkmark.square": "square")
                }
            }.offset(y:40)
            
            Spacer()
            HStack{
                Text("By writing your name you swear to giving this patient a shot of the Covid-19 vaccine.")
                    .font(.title3)
                    .multilineTextAlignment(.leading)
                    .offset(x:65)
                TextField("Signature", text: $nurseSignature).offset(x:68)
            }
            Spacer()
        }
        .background(Color.salmon).ignoresSafeArea()
    }
}

struct NurseView_Preview: PreviewProvider {
    static var previews: some View {
        NurseView()
    }
}
