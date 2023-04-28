//
//  DoctorScheduleView.swift
//  CareTrack
//
//  Created by weat on 27/04/23.
//

import SwiftUI

struct DoctorScheduleView: View {
    @State var bgColor:Color = Color(red: 242/255, green: 242/255, blue: 242/255)
    @State var symptomsColor:Color = Color(red: 157/255, green: 159/255, blue: 159/255)
    @State var timeArray:[String] = ["10:00","10:30","11:00","11:30","12:00","5:00","5:30","6:00","6:30","7:00"]
    
    @State var headingColor:Color = Color(red: 28/255, green: 28/255, blue: 28/255)
    
    let columns : [GridItem] = [GridItem(.fixed(UIScreen.screenWidth * 0.3)),
                                GridItem(.flexible())
    ]
    
    let dict = ["Prakhar Parakh":"Sick"]
    
    var body: some View {
        ZStack{
            bgColor.ignoresSafeArea()
            ScrollView {
                LazyVGrid(columns: columns){
                    ForEach(0..<timeArray.count, id : \.self){ index in
                        
                        Text(timeArray[index])
                            .padding()
                            .font(Font.custom("SF Pro Display Regular", size: 18))
                            .foregroundColor(headingColor)
                            .background{
                                RoundedRectangle(cornerRadius: 15)
                                    .foregroundColor(.white)
                                    .frame(width:87,height:96)
                            }
                            .padding()
                        
                        HStack{
                            VStack(alignment: .leading,spacing: 5){
                                Text("Prakhar Parakh")
                                    .frame(maxWidth: .infinity,alignment: .leading)
                                    .font(Font.custom("SF Pro Display Semibold", size: 16))
                                    .foregroundColor(headingColor)
                                Text("Sick")
                                    .font(Font.custom("SF Pro Display Medium", size: 12))
                                    .foregroundColor(symptomsColor)
                                Text("Thu, 26 Apr, 2023")
                                  .font(Font.custom("SF Pro Display Medium", size: 12))
                                    .foregroundColor(headingColor)
                            }.padding()
                            
                            Image(systemName: "chevron.right")
                                .padding(.trailing)
                                .font(Font.custom("SF Pro Display Semibold", size: 24))
                                .foregroundColor(.blue)
                        }
                        
                        .background{
                            RoundedRectangle(cornerRadius: 15)
                                .foregroundColor(.white)
                        }
                        .padding()
                        
                    }
                }
            }
        }
        
    }
}

struct DoctorScheduleView_Previews: PreviewProvider {
    static var previews: some View {
        DoctorScheduleView()
    }
}
