//
//  PatientRecordsView.swift
//  CareTrack
//
//  Created by Zeal Shah  on 20/04/23.
//

import SwiftUI

struct DictionaryElementWrapper: Hashable {
    let key: String
    let value: [String]
    
    init(_ element: (key: String, value: [String])) {
        self.key = element.key
        self.value = element.value
    }
}

struct PaitentRecordView: View {
    let DocData = ["Dr. Aryan Thakur": ["Food Poisoning", "11/02/2023"],"Dr. Mim Desai":["Cough", "20/11/2022"],"Dr. Ryan Khanna":["Headache", "30/11/2022"]]
    
    @State var searchDoc: String = ""
    @State var showMoreDoc: Bool = false
    @StateObject var prescriptionViewModel = PrescriptionViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(red: 0.949, green: 0.949, blue: 0.949)
                    .ignoresSafeArea()
                ScrollView(showsIndicators: false){
                    VStack{
                          
                        ForEach(searchResults){ i in
                            NavigationLink(destination: PatientPrescriptionView(id: i.id)) {
                                HStack{
                                    VStack(alignment: .leading,spacing:15){
                                        Text(i.DoctorName)
                                            .font(Font.custom("SF Pro Display Semibold", size: 20))
                                            .foregroundColor(.black)
                                        Text(i.Diagnosis)
                                            .font(Font.custom("SF Pro Display Medium", size: 16))
                                            .foregroundColor(Color(red: 157/255, green: 159/255, blue: 159/255))
                                            //.padding(.top)

                                        Text("Date : \(Foundation.Date(milliseconds: Int64(i.Date)).formatted(date: .complete, time: .omitted))")
                                            .font(Font.custom("SF Pro Display Light", size: 14))
                                            .foregroundColor(Color(red: 157/255, green: 159/255, blue: 159/255))

                                        
                                    }.padding()
                                        .padding(.leading)
                                    Spacer()
                                    Image(systemName: "chevron.right")
                                        .font(Font.custom("SF Pro Display Semibold", size: 24))
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
        }.searchable(text: $searchDoc,prompt: Text("Search Records"))
            .onFirstAppear {
                prescriptionViewModel.getUser()
            }
         
    }
    var searchResults: [Prescription] {
        if searchDoc.isEmpty {
            return prescriptionViewModel.prescriptionData
        } else {
            return prescriptionViewModel.prescriptionData.filter {$0.DoctorName.contains(searchDoc) }
        }
        
    }
    
    
}

struct PatientRecordsView_Previews: PreviewProvider {
    static var previews: some View {
        PaitentRecordView()
    }
}

