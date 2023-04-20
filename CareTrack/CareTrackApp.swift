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
    @AppStorage("signIn") var isSignIn: Bool = false

    var body: some Scene {
        WindowGroup {
            if !isSignIn{
                OnBoardingView()
            }
            else{
                ContentView()
            }
            
        }
    }
}
