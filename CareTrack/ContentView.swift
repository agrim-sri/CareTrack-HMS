//
//  ContentView.swift
//  CareTrack
//
//  Created by Sanskriti Sinha on 15/04/23.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        TabView{
            PatientDashboardView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Dashboard")
                }
            PaitentRecordView()
                .tabItem {
                    Image(systemName: "list.clipboard")
                    Text("Record")
                }
            DepartmentSelectionView()
                .tabItem {
                    Image(systemName: "plus.circle")
                    Text("Book")
                }
            PatientVitalsView()
                .tabItem {
                    Image(systemName: "staroflife")
                    Text("Vital")
                }
            PatientProfileView()
                .tabItem {
                    Image(systemName: "person")
                    Text("Profile")
                }
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

