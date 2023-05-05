//
//  AdminLandingView.swift
//  CareTrack
//
//  Created by weat on 04/05/23.
//

import SwiftUI

struct AdminLandingView: View {
    @State var bgColor:Color = Color(red: 242/255, green: 242/255, blue: 242/255)
    var body: some View {
        NavigationView{
            ZStack{
                bgColor
                    .ignoresSafeArea()
                ScrollView{
                    
                }
            }
        }
    }
}

struct AdminLandingView_Previews: PreviewProvider {
    static var previews: some View {
        AdminLandingView()
    }
}

