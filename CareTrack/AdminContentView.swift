//
//  AdminContentView.swift
//  CareTrack
//
//  Created by Prakhar Parakh on 05/05/23.
//

import SwiftUI

struct AdminContentView: View {
    var body: some View {
        TabView{
                    AdminLandingPageFinal()
                            .tabItem {
                                Image(systemName: "house")
                                Text("Dashboard")
                            }
                        PaitentRecordView()
                            .tabItem {
                                Image(systemName: "list.clipboard")
                                Text("Record")
                            }
                       
                        AddDoctor_View()
                            .tabItem {
                                Image(systemName: "person")
                                Text("Add Doctors")
                            }
        }
    }
}

struct AdminContentView_Previews: PreviewProvider {
    static var previews: some View {
        AdminContentView()
    }
}
