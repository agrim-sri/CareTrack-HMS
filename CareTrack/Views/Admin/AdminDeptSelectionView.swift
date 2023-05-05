//
//  DepartmentSelectionView.swift
//  CareTrack
//
//  Created by Prakhar Parakh on 19/04/23.
//

import SwiftUI



struct AdminDeptSelectionView: View {
    
    
    let dict: [String : String] = ["Surgery" : "Surgery",
                                   "Neurology" : "Neurology",
                                   "General" : "General",
                                   "Sonography" : "Sonography",
                                   "Vaccination" : "Vaccination",
                                   "Physiotherapy" : "Physiotherapy",
                                   "Senior HealthCare" : "Senior HealthCare",
                                   "Radiology" : "Radiology"
    ]
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),

    ]
    @State var showMore: Bool = false
    @State var searchDept: String = ""
    var id: String = ""
    var name: String = ""
    var body: some View {
        NavigationView{
            ZStack {
                Color(red: 0.949, green: 0.949, blue: 0.949)
                    .ignoresSafeArea()
                ScrollView(showsIndicators: false) {
                    VStack{
                        
                        Text("Departments")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.leading)
                            .font(Font.custom("SF Pro Display Semibold", size: 16))
                            .padding(.top)
                        LazyVGrid(columns: columns) {
                            ForEach(searchResults.sorted(by: >), id: \.key){key,value in
                                NavigationLink(destination: AdminDoctorSelectionView(department: key, id: id, name: name)) {
                                    VStack{
                                        Image(value)
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .padding()

                                        Text(key)
                                            .font(Font.custom("SF Pro Display Semibold", size: 16))
                                            .foregroundColor(.black)
                                            .padding(.bottom)
                                            
                                    }
                                    .background {
                                        RoundedRectangle(cornerRadius: 15)
                                            .foregroundColor(.white)
                                            .shadow(radius: 3)
                                    }
                                    .padding(.leading)
                                    .padding(.trailing)
                                    .padding(.bottom)
                                }
                                
                                
                            }
                            
                        }
                        if !showMore {
                            Button{
                                showMore.toggle()
                            }label: {
                                Text("Show More")
                            }
                        }
                        Spacer()
                    }

                }.navigationTitle(Text("Book Appointment"))
            }
                
        }.searchable(text: $searchDept)
    }
    var searchResults: [String: String] {
        var temp: [String : String] = [:]
        var count = 0
            if searchDept.isEmpty && !showMore {
                for (i,j) in dict{
                    if count<4{
                        temp[i] = j

                    }
                    count += 1
                }
                return temp
            }
            
        else if showMore && searchDept.isEmpty{
            return dict
        }
        
            else {
                return dict.filter {$0.key.contains(searchDept) }
            }
    }
}

struct AdminDeptSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        AdminDeptSelectionView()
    }
}

