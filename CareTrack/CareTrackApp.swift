//
//  CareTrackApp.swift
//  CareTrack
//
//  Created by Sanskriti Sinha on 15/04/23.
//

import SwiftUI
import Firebase

@main
struct CareTrackApp: App {
    init (){
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
