//
//  PatientPrescriptionView.swift
//  CareTrack
//
//  Created by Sanskriti Sinha on 02/05/2023.
//

import SwiftUI

struct PatientPrescriptionView: View {
    
    @StateObject var prescriptionViewModel = PrescriptionViewModel()
    var id: String = ""
    //     #F2F2F2
        @State var bgColor:Color = Color(red: 242/255, green: 242/255, blue: 242/255)
        // #1C1C1C
        @State var headingColor:Color = Color(red: 28/255, green: 28/255, blue: 28/255)
    //    #A1A8B0
        @State var dayColor:Color = Color(red: 161/255, green: 168/255, blue: 176/255)
    var body: some View {
        
        ZStack {
            Color(red: 0.949, green: 0.949, blue: 0.949)
                .ignoresSafeArea()
            
            ScrollView {
                
                if prescriptionViewModel.patientPrescriptionData.count > 0 {
                    ForEach(0..<prescriptionViewModel.patientPrescriptionData.count, id: \.self){ i in
                        VStack {
                            HStack {
                                VStack(spacing: 10){
                                    Text("\(prescriptionViewModel.patientPrescriptionData[i].DoctorName)")
                                        .padding(.leading)
                                        .frame(maxWidth: .infinity,alignment: .leading)
                                        .padding(.leading)
                                        .font(Font.custom("SF Pro Display Bold", size: 20))
//
//                                    Text("\(prescriptionViewModel.patientPrescriptionData[i].DoctorName)")
//                                        .frame(maxWidth: .infinity,alignment: .leading)
//                                        .padding(.leading)
//                                        .padding(.leading)
//                                        .font(Font.custom("SF Pro Display", size: 16))
//                                        .foregroundColor(Color(red: 0.467, green: 0.467, blue: 0.467))
                                    
                                    Text("21 yrs")
                                        .frame(maxWidth: .infinity,alignment: .leading)
                                        .padding(.leading)
                                        .padding(.leading)
                                        .font(Font.custom("SF Pro Display", size: 16))
                                        .foregroundColor(Color(red: 0.467, green: 0.467, blue: 0.467))
                                    
                                }
                                
                                Image("Profile Image")
                                    .resizable()
                                    .frame(width: 90, height: 90)
                                    .aspectRatio(contentMode: .fit)
                                    .padding(.trailing,30)
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
                                
                                Text("\(prescriptionViewModel.patientPrescriptionData[i].Symptoms)")
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
                            
                            PatientMedicineView(i:i)
                                .padding([.leading,.trailing])
                            VStack{
                                Text("Tests")
                                    .padding()
                                    .bold()
                                    .font(Font.custom("SF Pro Display", size: 24))
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding(.leading)
                                
                                Text("\(prescriptionViewModel.patientPrescriptionData[i].Test)")
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
                                
                                Text("\(prescriptionViewModel.patientPrescriptionData[i].Suggestion)")
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
                                
                                Text("\(prescriptionViewModel.patientPrescriptionData[i].Diagnosis)")
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
                            }.padding(.bottom,30)
                        }
                    }
                }
            }
            
        }.navigationTitle(Text("Prescription Form"))
            
            .task {
                prescriptionViewModel.getPrescription(id: id)
            }
        
    }
    
}

struct PatientPrescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        PatientPrescriptionView()
    }
}

