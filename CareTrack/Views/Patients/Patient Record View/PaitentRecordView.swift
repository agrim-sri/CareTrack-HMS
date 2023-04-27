//
//  PatientRecordsView.swift
//  CareTrack
//
//  Created by Zeal Shah  on 20/04/23.
//

import SwiftUI

struct PaitentRecordView: View {
    let datesarray: [String] = ["11/02/2023","20/11/2022","30/11/2022"]
    let docname:[String] = ["Dr. Aryan","Dr. Mim","Dr. Khanna"]
    let symname: [String] = ["Food Poisoning","Cough","Headache"]
    var body: some View {
        NavigationView {
            ZStack {
                Color(red: 0.949, green: 0.949, blue: 0.949)
                    .ignoresSafeArea()
                ScrollView(showsIndicators: false){
                    VStack{
                          
                        ForEach(0..<symname.count){ i in
                            NavigationLink(destination: PatientPrescriptionView()) {
                                HStack{
                                    VStack(alignment: .leading,spacing:15){
                                        Text(docname[i])
                                            .font(Font.custom("SF Pro Display Semibold", size: 20))
                                            .foregroundColor(.black)
                                        Text(symname[i])
                                            .font(Font.custom("SF Pro Display Medium", size: 16))
                                            .foregroundColor(Color(red: 157/255, green: 159/255, blue: 159/255))
                                            //.padding(.top)

                                        Text("Date: \(datesarray[i])")
                                            .font(Font.custom("SF Pro Display Light", size: 14))
                                            .foregroundColor(Color(red: 157/255, green: 159/255, blue: 159/255))

                                        
                                    }.padding()
                                        .padding(.leading)
                                    Spacer()
                                    Image(systemName: "chevron.right")
                                        .foregroundColor(.blue)
                                        .padding()
                                        .padding(.trailing)
                                }
                                .background{
                                    
                                    RoundedRectangle(cornerRadius: 20)
                                        
                                        .strokeBorder(.black, lineWidth: 0.5)
                                        .frame(width: UIScreen.screenWidth - 32)
                                        .background{
                                            Color.white
                                        }.cornerRadius(20)

                                    
                                        
                                }
                                .padding(.top)
                            }
                      
                        }
                        Spacer()
                        
                    }
                }
                .navigationTitle(Text("Records"))
            }
        }
    }
}

struct PatientRecordsView_Previews: PreviewProvider {
    static var previews: some View {
        PaitentRecordView()
    }
}
