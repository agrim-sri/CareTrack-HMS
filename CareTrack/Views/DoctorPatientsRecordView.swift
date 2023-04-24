//
//  DoctorPatientsRecordView.swift
//  CareTrack
//
//  Created by weat on 24/04/23.
//

import SwiftUI

struct DoctorPatientsRecordView: View {
    var body: some View {
        ZStack{
            Color(red: 0.949, green: 0.949, blue: 0.949)
                .ignoresSafeArea()
            ScrollView(showsIndicators: false){
                
                VStack{
                    ZStack{
                        RoundedRectangle(cornerRadius: 30)
                            .frame(width: UIScreen.screenWidth - 32,height: 200)
                            .foregroundColor(.white)
                            .shadow(radius: 3)
                        
                        VStack{
                            Text("Patient Details")
                                .font(Font.custom("SF Pro Display Bold", size: 28))
                                .frame(maxWidth:.infinity,alignment: .leading)
                                .padding()
                            
                            HStack {
                                Text("Name")
                                    .font(Font.custom("SF Pro Display Bold", size: 20))
                                    .frame(maxWidth:.infinity,alignment: .leading)
                                    .padding(.leading)
                                Text("Gaurav Ganjoo")
                                    .font(Font.custom("SF Pro Display Regular", size: 20))
                                    .frame(maxWidth:.infinity,alignment: .trailing)
                                    .padding(.trailing)
                            }
                            .padding()
                            HStack {
                                Text("Gender")
                                    .font(Font.custom("SF Pro Display Bold", size: 20))
                                    .frame(maxWidth:.infinity,alignment: .leading)
                                    .padding(.leading)
                                Text("Male")
                                    .font(Font.custom("SF Pro Display Regular", size: 20))
                                    .frame(maxWidth:.infinity,alignment: .trailing)
                                    .padding(.trailing)
                            }
                            .padding()
                            HStack {
                                Text("Age")
                                    .font(Font.custom("SF Pro Display Bold", size: 20))
                                    .frame(maxWidth:.infinity,alignment: .leading)
                                    .padding(.leading)
                                Text("55")
                                    .font(Font.custom("SF Pro Display Regular", size: 20))
                                    .frame(maxWidth:.infinity,alignment: .trailing)
                                    .padding(.trailing)
                            }
                            .padding()
                            HStack{
                                Text("Records")
                                    .font(Font.custom("SF Pro Display Bold", size: 28))
                                    .frame(maxWidth:.infinity,alignment: .leading)
                                    .padding()
                                
                                Image(systemName: "plus.circle.fill")
                                    .padding(.trailing)
                                    .font(Font.custom("SF Pro Display Bold", size: 24))
                                
                            }
                        }
                        
                    }
                    VStack{
                        ForEach(0..<5,id:\.self){i in
                            HStack{
                                VStack(alignment: .leading,spacing:15){
                                    Text("Date: 11/4/2023")
                                        .font(Font.custom("SF Pro Display Bold", size: 28))
                                        .foregroundColor(.white)
                                    Text("Dr. Omkar Oberoi")
                                        .font(Font.custom("SF Pro Display Semibold", size: 24))
                                        .foregroundColor(.white)
                                        .padding(.top)
                                    
                                    Text("Cardiology")
                                        .font(Font.custom("SF Pro Display Light", size: 24))
                                        .foregroundColor(.white)
                                    
                                    
                                }.padding()
                                    .padding(.leading)
                                Spacer()
                                Image(systemName: "chevron.right")
                                    .foregroundColor(.white)
                                    .padding()
                                    .padding(.trailing)
                            }
                            .background{
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(.blue)
                                    .frame(width: UIScreen.screenWidth - 32)
                            }
                            .padding(.top)
                        }
                    }
                    
                    Spacer()
                }
                
            }
            
        }
    }
}

struct DoctorPatientsRecordView_Previews: PreviewProvider {
    static var previews: some View {
        DoctorPatientsRecordView()
    }
}
