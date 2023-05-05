//
//  SplashScreenView.swift
//  CareTrack
//
//  Created by Sanskriti Sinha on 04/05/23.
//

import SwiftUI

struct SplashScreenView: View {
    @Binding var showLaunchScreen: Bool
    
    var body: some View {
        ZStack{
            Color.white
                .ignoresSafeArea()
            VStack(alignment: .center) {
                
                Image("Logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                Image("CareTrack")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(.leading)
                    .padding(.leading)
                    .padding(.trailing)
                    .padding(.leading)
                    .padding(.trailing)
                    .padding(.trailing)
            }
        }
        
       .onAppear{
            DispatchQueue.main.asyncAfter(deadline: .now() + 3){
                showLaunchScreen = false
            }
        }
    }
    
    struct SplashScreenView_Previews: PreviewProvider {
        static var previews: some View {
            SplashScreenView(showLaunchScreen: .constant(false))
        }
    }
}
