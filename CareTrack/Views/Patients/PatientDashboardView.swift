//
//  PatientDashboardView.swift
//  CareTrack
//
//  Created by Prakhar Parakh on 17/04/23.
//

import SwiftUI

struct PatientDashboardView: View {
    @State var medicine: [String] = ["Dolo 650","Crocin"]
    @State var dosage: [Int] = [1,2]
    var body: some View {
        ZStack {
            Color(red: 0.949, green: 0.949, blue: 0.949)
                .ignoresSafeArea()
            ScrollView(showsIndicators: false){
                VStack{
                    HStack{
                        VStack(alignment:.leading,spacing:15){
                            Text("Hello 👋🏻")
                                .font(Font.custom("SF Pro Display", size: 25))
                                .padding(.top)
                                
                            
                            Text("Gaurav Ganju")
                                .font(Font.custom("SF Pro Display Heavy", size: 30))
                                .foregroundColor(Color(red: 0.2901960784313726, green: 0.2901960784313726, blue: 0.2901960784313726))
                                
                            
                        }.padding(.leading)
                        Spacer()
                        Image("Profile Image")
                            .resizable()
                            .frame(width: 150, height: 150)
                            .padding(.trailing)
                            
                    }.padding(.bottom)
                    
                    VStack{
                        Text("Upcoming Appointments")
                            .font(Font.custom("SF Pro Display Bold", size: 25))
                            .frame(maxWidth: .infinity,alignment: .leading)
                            .padding(.leading)
                        ScrollView(.horizontal,showsIndicators: false){
                            HStack{
                                HStack{
                                    VStack(spacing: 5){
                                        Text("12")
                                            .font(Font.custom("SF Pro Display Heavy", size: 20))
                                            .foregroundColor(.white)
                                        Text("Tue")
                                            .font(Font.custom("SF Pro Display", size: 16))
                                            .foregroundColor(.white)
                                    }.padding()
                                        .background {
                                            RoundedRectangle(cornerRadius: 20)
                                                .foregroundColor(Color(red: 0.139, green: 0.561, blue: 0.996))
                                        }
                                        .padding()
                                        
                                    VStack(alignment: .leading, spacing:5){
                                        Text("09:30 AM")
                                            .font(Font.custom("SF Pro Display", size: 16))
                                            .foregroundColor(.white)
                                            
                                        Text("Dr. Mim Akhter")
                                            .font(Font.custom("SF Pro Display Heavy", size: 16))
                                            .fontWeight(.bold)
                                            .foregroundColor(.white)
                                        Text("Cardiologist")
                                            .font(Font.custom("SF Pro Display Light", size: 16))
                                            .foregroundColor(.white)
                                    }
                                    .padding()
                                }.background{
                                    RoundedRectangle(cornerRadius: 28)
                                        .foregroundColor(Color(red: 0.008, green: 0.49, blue: 0.998))
                                }.padding(.leading)
                                HStack{
                                    VStack(spacing: 5){
                                        Text("20")
                                            .font(Font.custom("SF Pro Display Heavy", size: 20))
                                            .foregroundColor(.white)
                                        Text("Tue")
                                            .font(Font.custom("SF Pro Display", size: 16))
                                            .foregroundColor(.white)
                                    }.padding()
                                        .background {
                                            RoundedRectangle(cornerRadius: 20)
                                                .foregroundColor(Color(red: 0.139, green: 0.561, blue: 0.996))
                                        }
                                        .padding()
                                        
                                    VStack(alignment: .leading, spacing:5){
                                        Text("09:30 AM")
                                            .font(Font.custom("SF Pro Display", size: 16))
                                            .foregroundColor(.white)
                                            
                                        Text("Dr. Mim Akhter")
                                            .font(Font.custom("SF Pro Display Heavy", size: 16))
                                            .fontWeight(.bold)
                                            .foregroundColor(.white)
                                        Text("Cardiologist")
                                            .font(Font.custom("SF Pro Display Light", size: 16))
                                            .foregroundColor(.white)
                                    }
                                    .padding()
                                }.background{
                                    RoundedRectangle(cornerRadius: 28)
                                        .foregroundColor(Color(red: 0.008, green: 0.49, blue: 0.998))
                                }
                            }
                            
                        }
                        
                    }
                    .padding(.top)
                    
                    VStack{
                        Text("Medicine Tracking")
                            .font(Font.custom("SF Pro Display Bold", size: 16))
                            .frame(maxWidth: .infinity,alignment: .leading)
                            .padding(.leading)
                        ForEach(0..<2,id:\.self){i in
                            VStack(alignment: .leading){
                                VStack(alignment: .leading){
                                    Text(self.medicine[i])
                                        .font(Font.custom("SF Pro Display Bold", size: 25))
                                        .padding(.leading)
                                }
                                HStack{
                                    Text("Your Medication is almost done!")
                                        .font(Font.custom("SF Pro Display Bold", size: 25))
                                        .padding(.trailing)
                                    ZStack{
                                        Circle()
                                            .stroke(
                                                Color.green.opacity(0.5),
                                                lineWidth: 15
                                            )
                                            
                                            .frame(width: 80)
                                        Circle()
                                            .trim(from: 0, to: 0.70)
                                            .stroke(
                                                Color.green,
                                                lineWidth: 15
                                            )
                                            .frame(width: 80)
                                        
                                            .rotationEffect(.degrees(-90))
                                            .overlay{
                                                Text("70%")
                                                    .font(Font.custom("SF Pro Display Bold", size: 20))
                                                    .foregroundColor(.green)
                                            }
                                    }
                                }.padding()
                               
                                HStack(spacing:120){
                                    Text("\(self.dosage[i]) per day")
                                        .font(Font.custom("SF Pro Display Bold", size: 16))
                                        .padding(.leading)
                                    Text("2 Day(s) Remaining")
                                        .font(Font.custom("SF Pro Display", size: 12))
                                }.padding(.bottom)
                                
                                
                                
                                    
                            }.padding(.top)
                            .background{
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(lineWidth: 2)
                                    .foregroundColor(.green)
                            }
                        }.padding(.top)
                        
                    }.padding(.top)
                }
            }
        }
    }
}

struct PatientDashboardView_Previews: PreviewProvider {
    static var previews: some View {
        PatientDashboardView()
    }
}
