//
//  DoctorSelectionView.swift
//  CareTrack
//
//  Created by weat on 20/04/23.
//

import SwiftUI

struct DoctorSelectionView: View {
    
    @State var searchText = ""
    @State var customBlue:CGColor = CGColor(red: 0.139, green: 0.561, blue: 0.996, alpha: 1)
    let docDict: [String: Int] = ["Dr. Omkar Oberoi": 5,
                                  "Dr. Prakesh Raj": 3,
                                  "Dr. Sammer Singh":6
                            ]
    var department: String = ""
    let experience: [Int] = [5,3,6]
     var body: some View {

             ScrollView(showsIndicators: false){
                 ForEach(searchResults.sorted(by: >), id: \.key){ key,value in
                     NavigationLink(destination: SlotBookView()) {
                         doctorListingCard(docName: key,department: department,experience: value)

                     }
                 }
                
                 
             }
             .navigationTitle("Doctors")
             .searchable(text: $searchText)
             
            
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
