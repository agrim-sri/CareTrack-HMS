//
//  PatientPrescriptionView.swift
//  CareTrack
//
//  Created by Zeal Shah  on 20/04/23.
//

import SwiftUI

struct PatientPrescriptionView: View {
    let columns: [GridItem] = [GridItem(.fixed(UIScreen.screenWidth / 3)),GridItem(.fixed(UIScreen.screenWidth / 3)),GridItem(.fixed(UIScreen.screenWidth / 3))]

    var body: some View {
        
        ScrollView {
            VStack {
//                Text("Prescription")
//                    .font(Font.custom("SF Pro Display Bold", size: 32))
//                    .frame(maxWidth: .infinity,alignment: .leading)
//                    .padding(.leading)
//                    .padding(.top)
                HStack{
                    Text("Symtoms:")
                        .font(Font.custom("SF Pro Display Semibold", size: 24))
                        .frame(maxWidth: .infinity,alignment: .leading)
                        .padding(.leading)
                    Text("Fatigue,Fever")
                        .font(Font.custom("SF Pro Display Light", size: 24))
                        .frame(maxWidth: .infinity,alignment: .leading)
                }
                .padding(.top)
                VStack{
                    Text("Medication")
                        .font(Font.custom("SF Pro Display Semibold", size: 24))
                        .frame(maxWidth: .infinity,alignment: .leading)
                        .padding(.leading)
                    HStack{
                        Text("Name")
                            .font(Font.custom("SF Pro Display Light", size: 24))
                            .padding(.leading)
                            .padding(.top,3)
                        Spacer()
                        Text("Dosage")
                            .font(Font.custom("SF Pro Display Light", size: 24))
                        Spacer()
                        Text("Days")
                            .font(Font.custom("SF Pro Display Light", size: 24))
                            .padding((.trailing))
                    }
                    Divider()
                        .frame(height:2)
                        .overlay(.black)
                        .padding()
                }
                
                .padding(.top)
                Text(" M - A - N")
                LazyVGrid(columns: columns) {
                    ForEach(0..<1) {i in
                        Text("Dolo 650")
                        Text("1 - 1 - 1")
                        Text("30")
                    }
                }
                HStack{
                    Text("Remarks:")
                        .font(Font.custom("SF Pro Display Semibold", size: 24))
                        .padding(.leading)
                    Spacer()
                    Text("Take Rest for 3 days. Eat Light Foods and avoid Oily Foods.")
                        .font(Font.custom("SF Pro Display Light", size: 20))
                        .padding(.trailing)
                        .padding(.top,10)
                        .lineLimit(3)
                    Spacer()
                    
                }
                .padding(.top)
                Divider()
                    .frame(height: 2)
                    .overlay(.black)
                    .padding()
                VStack{
                    Text("Test Prescribed:")
                        .font(Font.custom("SF Pro Display Semibold", size: 24))
                        .frame(maxWidth: .infinity,alignment: .leading)
                        .padding(.leading)
                    Text("X-Ray for chest")
                        .font(Font.custom("SF Pro Display Light", size: 20))
                        .frame(maxWidth: .infinity,alignment: .leading)
                        .padding(.leading)
                        .padding(.top,2)
                }
                HStack{
                    Text("Diagnosis:")
                        .font(Font.custom("SF Pro Display Semibold", size: 24))
                        .padding(.leading)
                    Spacer()
                    Text("Common Cold")
                        .font(Font.custom("SF Pro Display Light", size: 20))
                        .padding(.trailing)
                        .padding(.top,10)
                    Spacer()
                    Spacer()
                }
                .padding(.top,2)
                VStack{
                    Text("Advice:")
                        .font(Font.custom("SF Pro Display Semibold", size: 24))
                        .frame(maxWidth: .infinity,alignment: .leading)
                        .padding(.leading)
                    Text("Take Rest for 5 days")
                        .font(Font.custom("SF Pro Display Light", size: 20))
                        .frame(maxWidth: .infinity,alignment: .leading)
                        .padding(.leading)
                        .padding(.top,1)
                }
                .padding(.top,2)
            }
            Divider()
                .frame(height: 2)
                .overlay(.black)
                .padding()
            .padding(.top,2)
            HStack{
                Text("You paid:")
                    .font(Font.custom("SF Pro Display Semibold", size: 24))
                    .padding(.leading)
                Spacer()
                Text("Rs. 890")
                    .font(Font.custom("SF Pro Display Semibold", size: 24))
                    .padding(.trailing,30)
               
                
            }
        }
        .navigationTitle(Text("Prescription"))
    }
}

struct PatientPrescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        PatientPrescriptionView()
    }
}
