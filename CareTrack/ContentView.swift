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
            PatientDashboardView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Record")
                }
            PatientDashboardView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Book")
                }
            PatientDashboardView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Vital")
                }
            PatientDashboardView()
                .tabItem {
                    Image(systemName: "house")
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
