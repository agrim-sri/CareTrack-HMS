//
//  DoctorSelectionView.swift
//  CareTrack
//
//  Created by weat on 20/04/23.
//

import SwiftUI

struct DoctorSelectionView: View {
    
    @ObservedObject var model = DoctorSelectionViewModel()
    
    @State var searchText = ""
    @State var customBlue:CGColor = CGColor(red: 0.139, green: 0.561, blue: 0.996, alpha: 1)
    let docDict: [String: Int] = ["Dr. Omkar Oberoi": 5,
                                  "Dr. Prakesh Raj": 3,
                                  "Dr. Sammer Singh":6
                            ]
    var department: String = ""
    let experience: [Int] = [5,3,6]
    var body: some View {
        ZStack{
            Color(red: 0.949, green: 0.949, blue: 0.949)
                .ignoresSafeArea()
            ScrollView(showsIndicators: false){
                ForEach(model.list){ d in
                    NavigationLink(destination: SlotBookView(docID: model.list.first!.id,docName: d.name,department: d.department,experience: d.Experience)) {
                        
                        VStack{
                            ZStack{
                                RoundedRectangle(cornerRadius: 30)
                                    .frame(width: UIScreen.screenWidth - 32,height: 150)
                                    .foregroundColor(.white)
                                    .shadow(radius: 3)
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
                                .frame(width: UIScreen.screenWidth - 32,alignment: .trailing)
                            }
                            
                            
                        }
                        
                        
                        
                    }
                }
                
                
            }
            .navigationTitle("Doctors")
            .searchable(text: $searchText)
        }.task{
            model.getData()
        }
            
    }
        var searchResults: [String: Int] {
            if searchText.isEmpty {
                return docDict
            } else {
                return docDict.filter {$0.key.contains(searchText) }
            }
            
        }
}

struct DoctorSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        DoctorSelectionView()
    }
}
