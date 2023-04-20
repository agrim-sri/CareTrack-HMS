//
//  PatientProfileView.swift
//  CareTrack
//
//  Created by weat on 20/04/23.
//

import SwiftUI

struct PatientProfileView: View {
    var body: some View {
        ScrollView{
        VStack{
            Group{
                HStack{
                    Image("Profile Image")
                        .padding(.trailing)
                    Text("Gaurav Ganju")
                        .font(Font.custom("SF Pro Display Heavy", size: 32))
                        .foregroundColor(Color(red: 0.2901960784313726, green: 0.2901960784313726, blue: 0.2901960784313726))
                }
                .frame(maxWidth: .infinity,alignment: .center)
                .padding()
                Divider()
                
                HStack{
                    Text("Email Address")
                        .font(Font.custom("SF Pro Display Regular", size: 28))
                        .foregroundColor(Color(red: 0.2901960784313726, green: 0.2901960784313726, blue: 0.2901960784313726))
                    Spacer()
                    Text("abc@cde.com")
                        .font(Font.custom("SF Pro Display Regular", size: 28))
                        .foregroundColor(Color(red: 0.2901960784313726, green: 0.2901960784313726, blue: 0.2901960784313726))
                }
                .padding()
                Divider()
                
                HStack{
                    Text("Phone Number")
                        .font(Font.custom("SF Pro Display Regular", size: 28))
                        .foregroundColor(Color(red: 0.2901960784313726, green: 0.2901960784313726, blue: 0.2901960784313726))
                    Spacer()
                    Text("1234567908")
                        .font(Font.custom("SF Pro Display Regular", size: 28))
                        .foregroundColor(Color(red: 0.2901960784313726, green: 0.2901960784313726, blue: 0.2901960784313726))
                }
                .padding()
                Divider()
                
                HStack{
                    Text("DOB")
                        .font(Font.custom("SF Pro Display Regular", size: 28))
                        .foregroundColor(Color(red: 0.2901960784313726, green: 0.2901960784313726, blue: 0.2901960784313726))
                    Spacer()
                    Text("02/02/2000")
                        .font(Font.custom("SF Pro Display Regular", size: 28))
                        .foregroundColor(Color(red: 0.2901960784313726, green: 0.2901960784313726, blue: 0.2901960784313726))
                }
                .padding()
                Divider()
                
                HStack{
                    Text("Gender")
                        .font(Font.custom("SF Pro Display Regular", size: 28))
                        .foregroundColor(Color(red: 0.2901960784313726, green: 0.2901960784313726, blue: 0.2901960784313726))
                    Spacer()
                    Text("Male")
                        .font(Font.custom("SF Pro Display Regular", size: 28))
                        .foregroundColor(Color(red: 0.2901960784313726, green: 0.2901960784313726, blue: 0.2901960784313726))
                }
                .padding()
                Divider()
                
            }
            
            Button {
                
            } label: {
                RoundedRectangle(cornerRadius: 15)
                    
                    .frame(width: 150, height: 40)
                    .padding()
                    .overlay {
                        Text("Log Out")
                            .font(Font.custom("Archivo", size: 17))
                            .fontWeight(.medium)
                        
                    }
            }
        }
    }
    }
}

struct PatientProfileView_Previews: PreviewProvider {
    static var previews: some View {
        PatientProfileView()
    }
}
