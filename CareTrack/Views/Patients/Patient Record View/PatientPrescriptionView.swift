//
//  PatientPrescriptionView.swift
//  CareTrack
//
//  Created by Sanskriti Sinha on 02/05/2023.
//

import SwiftUI

struct PatientPrescriptionView: View {

    var body: some View {
        
        ZStack {
            Color(red: 0.949, green: 0.949, blue: 0.949)
                .ignoresSafeArea()
            
            ScrollView {
                
                VStack {
                    HStack {
                        VStack(spacing: 10){
                            Text("Omkar Oberio")
                                .padding(.leading)
                                .frame(maxWidth: .infinity,alignment: .leading)
                                .padding(.leading)
                                .font(Font.custom("SF Pro Display Bold", size: 20))
                                
                            Text("Male")
                                .frame(maxWidth: .infinity,alignment: .leading)
                                .padding(.leading)
                                .padding(.leading)
                                .font(Font.custom("SF Pro Display", size: 16))
                                .foregroundColor(Color(red: 0.467, green: 0.467, blue: 0.467))
                            
                            Text("21 yrs")
                                .frame(maxWidth: .infinity,alignment: .leading)
                                .padding(.leading)
                                .padding(.leading)
                                .font(Font.custom("SF Pro Display", size: 16))
                                .foregroundColor(Color(red: 0.467, green: 0.467, blue: 0.467))
                                
                        }
                        
                        Image("Profile Image")
                            .resizable()
                            .frame(width: 120, height: 120)
                            .aspectRatio(contentMode: .fit)
                            .padding(.trailing)
                    }.background{
                        RoundedRectangle(cornerRadius: 15)
                            .foregroundColor(.white)
                            .frame(width: UIScreen.screenWidth - 32)
                    }.padding(.top)
                    
                    VStack{
                        Text("Symptoms")
                            .padding()
                            .foregroundColor(.black)
                            .bold()
                            .font(Font.custom("SF Pro Display", size: 24))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.leading)
                        
                        Text("Fever, Headache, Fatigue")
                            .frame(maxWidth: .infinity,alignment: .leading)
                            .padding(.leading)
                            .padding(.leading)
                            .background {
                                RoundedRectangle(cornerRadius: 15)
                                    .frame(width: UIScreen.screenWidth - 32, height: 60)
                                    .foregroundColor(.white)
                            }.padding(.top)
                            .foregroundColor(Color(red: 0.467, green: 0.467, blue: 0.467))
                            .font(Font.custom("SF Pro Display Light", size: 20))
                    }.padding(.bottom)
                    
                    VStack{
                        Text("Medications")
                            .padding()
                            .foregroundColor(.black)
                            .bold()
                            .font(Font.custom("SF Pro Display", size: 24))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.leading)
                            
                        
                        RoundedRectangle(cornerRadius: 15)
                            .frame(width: UIScreen.screenWidth - 32, height: 250)
                            .foregroundColor(.white)
                            .overlay{
                                VStack{
                                    
                                    HStack {
                                        VStack{
                                            Text("Dolo 6050")
                                                .frame(maxWidth: .infinity, alignment: .leading)
                                                .padding(.leading)
                                                .font(Font.custom("SF Pro Display Semibold", size: 20))
                                            
                                            Text("After having food")
                                                .frame(maxWidth: .infinity, alignment: .leading)
                                                .padding(.leading)
                                                .padding(.top, 1)
                                                .foregroundColor(Color(red: 0.635, green: 0.643, blue: 0.643))
                                            
                                            Text("(30 days)")
                                                .frame(maxWidth: .infinity, alignment: .leading)
                                                .padding(.leading)
                                                .padding(.top, 1)
                                                .foregroundColor(.black)
                                        }
                                        
                                        VStack{
                                            Image(systemName: "sun.max")
                                            .foregroundColor(Color(red: 0.999, green: 0.751, blue: 0.398))
                                            .bold()
                                            
                                            Text("1")
                                                .padding()
                                                .bold()
                                            
                                            Text("M")
                                                .bold()
                                        }
                                        
                                        VStack{
                                            Image(systemName: "sun.haze")
                                                .foregroundColor(Color(red: 1.001, green: 0.502, blue: 0.225))
                                            .bold()
                                            
                                            Text("0")
                                                .padding()
                                                .bold()
                                            
                                            Text("A")
                                                .bold()
                                        }
                                        
                                        VStack{
                                            Image(systemName: "moon")
                                                .foregroundColor(Color(red: 0.003, green: 0.387, blue: 0.791))
                                            .bold()
                                            
                                            Text("1")
                                                .padding()
                                                .bold()
                                            
                                            Text("N")
                                                .bold()
                                        }
                                    }
                                    
                                    Divider()
                                        .background(.black)
                                        .frame(width: UIScreen.screenWidth - 64)
                                    
                                    HStack {
                                        VStack{
                                            Text("Dolo 6050")
                                                .frame(maxWidth: .infinity, alignment: .leading)
                                                .padding(.leading)
                                                .font(Font.custom("SF Pro Display Semibold", size: 20))
                                            
                                            Text("After having food")
                                                .frame(maxWidth: .infinity, alignment: .leading)
                                                .padding(.leading)
                                                .padding(.top, 1)
                                                .foregroundColor(Color(red: 0.635, green: 0.643, blue: 0.643))
                                            
                                            Text("(30 days)")
                                                .frame(maxWidth: .infinity, alignment: .leading)
                                                .padding(.leading)
                                                .padding(.top, 1)
                                                .foregroundColor(.black)
                                        }
                                        
                                        VStack{
                                            Image(systemName: "sun.max")
                                            .foregroundColor(Color(red: 0.999, green: 0.751, blue: 0.398))
                                            .bold()
                                            
                                            Text("1")
                                                .padding()
                                                .bold()
                                            
                                            Text("M")
                                                .bold()
                                        }
                                        
                                        VStack{
                                            Image(systemName: "sun.haze")
                                                .foregroundColor(Color(red: 1.001, green: 0.502, blue: 0.225))
                                            .bold()
                                            
                                            Text("0")
                                                .padding()
                                                .bold()
                                            
                                            Text("A")
                                                .bold()
                                        }
                                        
                                        VStack{
                                            Image(systemName: "moon")
                                                .foregroundColor(Color(red: 0.003, green: 0.387, blue: 0.791))
                                            .bold()
                                            
                                            Text("1")
                                                .padding()
                                                .bold()
                                            
                                            Text("N")
                                                .bold()
                                        }
                                    }
                                    
                                }
                                }
                            }
                    
                    VStack{
                        Text("Tests")
                            .padding()
                            .bold()
                            .font(Font.custom("SF Pro Display", size: 24))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.leading)
                        
                        Text("X-ray, Blood test for malaria.")
                            .frame(maxWidth: .infinity,alignment: .leading)
                            .foregroundColor(Color(red: 0.467, green: 0.467, blue: 0.467))
                            .padding(.leading)
                            .padding(.leading)
                            .background {
                                RoundedRectangle(cornerRadius: 15)
                                    .frame(width: UIScreen.screenWidth - 32, height: 60)
                                    .foregroundColor(.white)
                            }.padding(.top)
                            .foregroundColor(Color(red: 0.467, green: 0.467, blue: 0.467))
                            .font(Font.custom("SF Pro Display Light", size: 20))
                            
                    }.padding(.bottom)
                    
                    VStack{
                        Text("Suggestions")
                            .padding()
                            .foregroundColor(.black)
                            .bold()
                            .font(Font.custom("SF Pro Display", size: 24))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.leading)
                        
                        Text("Drink orange juice, Be healthy, Sleep properly.")
                            .frame(maxWidth: .infinity,alignment: .leading)
                            .padding(.leading)
                            .padding(.leading)
                            .background {
                                RoundedRectangle(cornerRadius: 15)
                                    .frame(width: UIScreen.screenWidth - 32, height: 60)
                                    .foregroundColor(.white)
                            }.padding(.top)
                            .foregroundColor(Color(red: 0.467, green: 0.467, blue: 0.467))
                            .font(Font.custom("SF Pro Display Light", size: 20))
                    }.padding(.bottom)
                    
                    VStack{
                        Text("Diagnosis")
                            .padding()
                            .foregroundColor(.black)
                            .bold()
                            .font(Font.custom("SF Pro Display", size: 24))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.leading)
                        
                        Text("Depression, Anxiety.")
                            .frame(maxWidth: .infinity,alignment: .leading)
                            .padding(.leading)
                            .padding(.leading)
                            .background {
                                RoundedRectangle(cornerRadius: 15)
                                    .frame(width: UIScreen.screenWidth - 32, height: 60)
                                    .foregroundColor(.white)
                            }.padding(.top)
                            .foregroundColor(Color(red: 0.467, green: 0.467, blue: 0.467))
                            .font(Font.custom("SF Pro Display Light", size: 20))
                    }.padding(.bottom)
                    }
                }
                
            }.navigationTitle(Text("Prescription Form"))
                
        }
    }

struct PatientPrescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        PatientPrescriptionView()
    }
}
