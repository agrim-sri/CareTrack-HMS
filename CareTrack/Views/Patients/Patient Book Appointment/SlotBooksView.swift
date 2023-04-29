//
//  SlotBooksView.swift
//  CareTrack
//
//  Created by Mayank Rai on 28/04/23.
//

import SwiftUI

struct SlotBooksView: View {
    
    @State private var appointmentDate = Date()
    @State var selectedButton: Int = -1
    
    var body: some View {
        
        ZStack{
            Color(red: 0.949, green: 0.949, blue: 0.949)
                .ignoresSafeArea()
            
            ScrollView {
                VStack {
                    VStack{
                        HStack{
                            VStack(alignment: .leading){
                                Text("Dr. Mim Akhter")
                                    .font(Font.custom("SF Pro Display", size: 24))
                                
                                    .bold()
                                    .padding(.top)
                                HStack{
                                    Text("Surgeon (4.5)")
                                        .font(Font.custom("SF Pro Display", size: 20))
                                    Image(systemName: "star.fill")
                                        .foregroundColor(Color(red: 0.877, green: 0.625, blue: 0.118))
                                }.padding(.top, 1)
                                
                                
                                Text("(MBBS Ph.D, Fellow, International College of Surgeons")
                                    .font(Font.custom("SF Pro Display", size: 12))
                                    .padding(.top, 0.5)
                                    .multilineTextAlignment(.leading)
                                
                                Text("15+ years of Experience")
                                    .font(Font.custom("SF Pro Display", size: 12))
                                    .padding(.top, 0.5)
                                    .padding(.bottom)
                            }
                            
                            RoundedRectangle(cornerRadius: 15)
                                .frame(width: 80, height: 80)
                                .overlay{
                                    Image("docImg")
                                        .resizable()
                                        .frame(width: 80, height: 80)
                                        .cornerRadius(15)
                                }
                            
                            
                        }.padding()
                            .background{
                                RoundedRectangle(cornerRadius: 15)
                                    .foregroundColor(.blue)
                                    .padding()
                                    .frame(width: UIScreen.screenWidth)
                            }
                        
                        
                        
                    }.foregroundColor(.white)
                    
                    VStack{
                        
                        
                        Text("Appointment Date")
                            .font(Font.custom("SF Pro Display Semibold",size: 20))
                            .frame(maxWidth: .infinity,alignment: .leading)
                            .padding(.top)
                            .padding(.leading)
                        
                        
//                        DatePicker("Choose a date :",selection: $appointmentDate,in: range,displayedComponents: .date)
//                            .padding()
//                            .padding([.leading, .trailing])
//                            .background{
//                                RoundedRectangle(cornerRadius: 20)
//                                    .foregroundColor(.white)
//                                    .padding([.leading, .trailing])
//                            }
                        
                    }
                    //SlotBookView()
                }
            }
            
            
                
                
                
            }
        }
        
        struct SlotBooksView_Previews: PreviewProvider {
            static var previews: some View {
                SlotBooksView()
            }
        }
    }
