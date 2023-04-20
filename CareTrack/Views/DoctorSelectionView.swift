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
     var body: some View {

             ScrollView(showsIndicators: false){
                 doctorListingCard()
                 doctorListingCard()
                 doctorListingCard()
                 doctorListingCard()
                 doctorListingCard()
                 doctorListingCard()
                 doctorListingCard()
                 doctorListingCard()
                 
             }
             .navigationTitle("Doctors")
             .searchable(text: $searchText)
             
            
    }
}

struct DoctorSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        DoctorSelectionView()
    }
}
