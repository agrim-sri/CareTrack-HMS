//
//  ManageDataPage.swift
//  CareTrack
//
//  Created by Tanmay Sharma on 26/04/23.
//

import SwiftUI

struct doctorTempData{
    let name : String
    let department : String
    var rating : Float
}

struct patientTempData{
    let name : String
    var age : Int
    let gender : String
}

class ManageDataSwitch : ObservableObject{
    @Published var isDoctor = 0
}

let picker : ManageDataSwitch = ManageDataSwitch()

struct AdminManageView: View {
    
    @ObservedObject var pickerMDP = picker
    
    var body: some View {
        ScrollView{
            VStack{
                
                Text("Manage Data")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    .padding(.horizontal)
                    .multilineTextAlignment(.leading)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    
                implementSearchBar()
                
                HStack {
                    Picker(selection: $pickerMDP.isDoctor, label: Text("Left Column")) {
                        Text("Doctor")
                            .tag(0)
                        Text("Patient")
                            .tag(1)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .padding()
                }
                
                loadData()
                
                
            }
        }.background(Color(#colorLiteral(red: 0.9593991637, green: 0.9593990445, blue: 0.9593991637, alpha: 1)))
        
        
    }
}

struct implementSearchBar : View{
    
    @State private var searchText = ""
    @State private var showCancelButton = false
    
    var body : some View{
        
        HStack {
            HStack {
                Image(systemName: "magnifyingglass")

                TextField("Search", text: $searchText, onEditingChanged: { isEditing in
                    self.showCancelButton = true
                }, onCommit: {
                    // Perform search
                })
                .foregroundColor(.primary)

                Button(action: {
                    self.searchText = ""
                }) {
                    Image(systemName: "xmark.circle.fill")
                        .opacity(searchText == "" ? 0 : 1)
                }
            }
            .padding(EdgeInsets(top: 8, leading: 6, bottom: 8, trailing: 6))
            .foregroundColor(.secondary)
            .background(Color(.secondarySystemBackground))
            .cornerRadius(10.0)

            if showCancelButton {
                Button("Cancel") {
                    UIApplication.shared.keyWindow?.endEditing(true)
                    self.searchText = ""
                    self.showCancelButton = false
                }
                .foregroundColor(Color(.systemBlue))
            }
        }
        .padding(.horizontal)
        .navigationBarHidden(showCancelButton)
        
    }
}

struct loadData : View{
    
    @ObservedObject var pickerLD = picker
    
    let temp_data_doc = [
        doctorTempData(name: "Doc1", department: "Surgery", rating: 9.4),
        doctorTempData(name: "Doc2", department: "ENT", rating: 9.0),
        doctorTempData(name: "Doc3", department: "Neurology", rating: 9.8),
        doctorTempData(name: "Doc4", department: "Psychology", rating : 9.3)
    ]
    
    let temp_data_patient = [
        patientTempData(name: "p1", age: 20, gender: "Male"),
        patientTempData(name: "p2", age: 43, gender: "Male"),
        patientTempData(name: "p3", age: 55, gender: "Female"),
        patientTempData(name: "p4", age: 43, gender: "Male"),
        patientTempData(name: "p5", age: 12, gender: "Male"),
        patientTempData(name: "p6", age: 65, gender: "Female")
    ]
    
    var body : some View{
        
        LazyVStack{
            
            if pickerLD.isDoctor == 0{
                ForEach(0..<Int(temp_data_doc.count)){index in
                    Button {
                        //
                    } label: {
                        RoundedRectangle(cornerRadius: 15)
                            .frame(height : UIScreen.main.bounds.size.height * 0.15)
                            .padding()
                            .foregroundColor(.white)
                            .shadow(radius: 5)
                            .overlay(
                                HStack{
                                    VStack{
                                        Text("Name : \(temp_data_doc[index].name)")
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                            .padding(.horizontal)
                                            .padding(.horizontal)
                                        
                                        Text("Department : \(temp_data_doc[index].department)")
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                            .padding(.horizontal)
                                            .padding(.horizontal)
                                        Text("Rating : \(String(temp_data_doc[index].rating))")
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                            .padding(.horizontal)
                                            .padding(.horizontal)
                                    }
                                    
                                    Image(systemName: "person.circle")
                                        .resizable()
                                        .frame(width: 80, height: 80)
                                        .foregroundColor(.blue)
                                        .padding(.trailing)
                                        .padding(.trailing)
                                }
                            )
                    }
                }
            }
            else{
                ForEach(0..<Int(temp_data_patient.count)){index in
                    Button {
                        //
                    } label: {
                        RoundedRectangle(cornerRadius: 15)
                            .frame(height : UIScreen.main.bounds.size.height * 0.15)
                            .padding()
                            .foregroundColor(.white)
                            .shadow(radius: 5)
                            .overlay(
                                HStack{
                                    VStack{
                                        Text("Name : \(temp_data_patient[index].name)")
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                            .padding(.horizontal)
                                            .padding(.horizontal)
                                        
                                        Text("Gender : \(temp_data_patient[index].gender)")
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                            .padding(.horizontal)
                                            .padding(.horizontal)
                                        Text("Age : \(String(temp_data_patient[index].age))")
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                            .padding(.horizontal)
                                            .padding(.horizontal)
                                    }
                                    
                                    Image(systemName: "person.circle")
                                        .resizable()
                                        .frame(width: 80, height: 80)
                                        .foregroundColor(.blue)
                                        .padding(.trailing)
                                        .padding(.trailing)
                                }
                            )
                    }
                }
            }
            
        }
        
    }
    
}

struct ManageDataPage_Previews: PreviewProvider {
    static var previews: some View {
        AdminManageView()
        
    }
}

