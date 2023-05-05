//
//  PatientMedicineView.swift
//  CareTrack
//
//  Created by Prakhar Parakh on 03/05/23.
//

import SwiftUI

struct PatientMedicineView: View {
    @StateObject var prescriptionViewModel = PrescriptionViewModel()
    @State var i: Int = 0
    var body: some View {
        VStack{
            Text("Medications")
                .padding()
                .foregroundColor(.black)
                .bold()
                .font(Font.custom("SF Pro Display", size: 24))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading)
            
            if prescriptionViewModel.prescriptionData.count > 0 {
                
                
                ForEach(0..<prescriptionViewModel.prescriptionData[i].Medication.count) { k in
                    VStack{
                        
                        HStack {
                            VStack{
                                Text("\(prescriptionViewModel.prescriptionData[i].Medication[k].MedicineName)")
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding(.leading)
                                    .font(Font.custom("SF Pro Display Semibold", size: 20))
                                
                                Text("\(prescriptionViewModel.prescriptionData[i].Medication[k].Remarks)")
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding(.leading)
                                    .padding(.top, 1)
                                    .foregroundColor(Color(red: 0.635, green: 0.643, blue: 0.643))
                                
                                Text("\(prescriptionViewModel.prescriptionData[i].Medication[k].Duration) Days")
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding(.leading)
                                    .padding(.top, 1)
                                    .foregroundColor(.black)
                            }
                            
                            VStack{
                                Image(systemName: "sun.max")
                                    .foregroundColor(Color(red: 0.999, green: 0.751, blue: 0.398))
                                    .bold()
                                
                                Text("\(prescriptionViewModel.prescriptionData[i].Medication[k].Morning)")
                                    .padding()
                                    .bold()
                                
                                Text("M")
                                    .bold()
                            }
                            
                            VStack{
                                Image(systemName: "sun.haze")
                                    .foregroundColor(Color(red: 1.001, green: 0.502, blue: 0.225))
                                    .bold()
                                
                                Text("\(prescriptionViewModel.prescriptionData[i].Medication[k].Afternoon)")
                                    .padding()
                                    .bold()
                                
                                Text("A")
                                    .bold()
                            }
                            
                            VStack{
                                Image(systemName: "moon")
                                    .foregroundColor(Color(red: 0.003, green: 0.387, blue: 0.791))
                                    .bold()
                                
                                Text("\(prescriptionViewModel.prescriptionData[i].Medication[k].Night)")
                                    .padding()
                                    .bold()
                                
                                Text("N")
                                    .bold()
                            }
                        }
                        
                        
                        
                        
                    }
                    .padding()
                    .background{
                        RoundedRectangle(cornerRadius: 15)
                            .foregroundColor(.white)
                        
                    }
                    
                    
                    
                    
                    
                    
                }
                
            }
        }
        .onAppear{
            prescriptionViewModel.getUser()
        }

    }
}

struct PatientMedicineView_Previews: PreviewProvider {
    static var previews: some View {
        PatientMedicineView()
    }
}

