//
//  DoctorContentView.swift
//  CareTrack
//
//  Created by Sanskriti Sinha on 28/04/23.
//

import SwiftUI

struct DoctorContentView: View {
    var body: some View {
        TabView{
            DoctorLandingPageView()
                            .tabItem {
                                Image(systemName: "house")
                                Text("Dashboard")
                            }
                        PaitentRecordView()
                            .tabItem {
                                Image(systemName: "list.clipboard")
                                Text("Record")
                            }
                       
            DoctorProfileView()
                            .tabItem {
                                Image(systemName: "person")
                                Text("Profile")
                            }
        }
    }
}

struct DoctorContentView_Previews: PreviewProvider {
    static var previews: some View {
        DoctorContentView()
    }
}

