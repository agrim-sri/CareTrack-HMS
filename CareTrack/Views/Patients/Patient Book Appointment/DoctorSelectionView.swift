//
//  DoctorSelectionView.swift
//  CareTrack
//
//  Created by weat on 20/04/23.
//

import SwiftUI

struct DoctorSelectionView: View {
    
    @StateObject var model = DoctorSelectionViewModel()
    
    @State var searchText = ""
    @State var customBlue:CGColor = CGColor(red: 0.139, green: 0.561, blue: 0.996, alpha: 1)

    var department: String = ""
    var body: some View {
        ZStack{
            Color(red: 0.949, green: 0.949, blue: 0.949)
                .ignoresSafeArea()
            ScrollView(showsIndicators: false){
                ForEach(searchResults){ d in
                    NavigationLink(destination: SlotBooksView(docID: d.id,docName: d.name, dept: d.department,rating: 4,qualification: d.Qualification,exp : d.Experience)) {
                        
                        VStack{
                            ZStack{
                                RoundedRectangle(cornerRadius: 30)
                                    .frame(width: UIScreen.screenWidth - 44,height: 150)
                                    .foregroundColor(.white)
                                    .shadow(radius: 1)
                                HStack{
                                    VStack(alignment: .leading,spacing: 5){
                                        Text(d.name)
                                            .font(Font.custom("SF Pro Display", size: 24))
                                            .fontWeight(.bold)
                                            .multilineTextAlignment(.leading)
                                            .foregroundColor(.black)
                                        Text(d.department)
                                            .font(Font.custom("SF Pro Display", size: 16))
                                            .foregroundColor(.secondary)
                                        Text("Experience : \(d.Experience) years")
                                            .font(Font.custom("SF Pro Display", size: 16))
                                            .foregroundColor(.black)
                                        
                                        HStack{
                                            Image(systemName: "star.fill")
                                                .foregroundColor(.yellow)
                                            Text("4.5")
                                                .font(Font.custom("SF Pro Display", size: 16))
                                                .foregroundColor(.black)
                                        }
                                    }
                                    .padding()
                                    Spacer()
                                    Image("docImg")
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 80, height: 80)
                                        .cornerRadius(20)
                                        .clipped()
                                    
                                    Image(systemName: "chevron.right")
                                        .resizable()
                                        .frame(width: 19,height: 32,alignment: .trailing)
                                        .fontWeight(.bold)
                                        .padding()
                                        .foregroundColor(.black)
                                }
                                .frame(width: UIScreen.screenWidth - 44,alignment: .trailing)
                            }
                            
                            
                        }
                        
                        
                        
                    }
                }
                
                
            }
            .navigationTitle("Doctors")
            .searchable(text: $searchText)
        }.task{
            model.getDoctors(dept: department)
        }
            
    }
        var searchResults: [Doctor] {
            if searchText.isEmpty {
                return model.doctors
            } else {
                return model.doctors.filter {$0.name.contains(searchText) }
            }
            
        }
    
    
    
}

struct DoctorSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        DoctorSelectionView()
    }
}
