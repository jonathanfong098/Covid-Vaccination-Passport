//
//  ContentView.swift
//  CovidVaccinationPassport
//
//  Created by Jonathan Fong on 4/30/21.
//

import SwiftUI

struct ContentView: View {
    
    func button_action()
    {
        print("Redirecting to adding vaccine card")
    }
    
    var body: some View {
    
        var status:Bool = true
        
        VStack
        {
            HStack
            {
            //status bar
                if (status)
                {
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
                }
                else
                {
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
            Text("Covid Vaccine Passport Code ")
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
