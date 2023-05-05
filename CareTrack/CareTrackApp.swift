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
    @AppStorage("usersignIn") var userIsSignIn: Bool = false
    @AppStorage("doctorsignIn") var doctorIsSignIn: Bool = false
    @State var showLaunchScreen: Bool = true

    var body: some Scene {
        WindowGroup {
            
            ZStack{
                
                if doctorIsSignIn{
                    DoctorContentView()
                }
                else if userIsSignIn{
                    ContentView()
                }
                else{
                    OnBoardingView()

                }
                if showLaunchScreen{
                    SplashScreenView(showLaunchScreen: $showLaunchScreen)
                }
            }
            
            
        }
    }
}

