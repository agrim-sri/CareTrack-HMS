//
//  SignView.swift
//  CareTrack
//
//  Created by weat on 05/05/23.
//

import SwiftUI

struct SignView: View {
    var body: some View {
        
        VStack{
            
            VStack{
                
                Image("CareTrack")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: UIScreen.screenWidth - 150)
                    .padding()
                
                Text("Sign Up")
                    .font(Font.custom("SF Pro Display Bold", size: 40))
                    .foregroundColor(Color(red: -0.003, green: 0.478, blue: 0.999))
            }
            
            
        }
        
        
    }
}

struct SignView_Previews: PreviewProvider {
    static var previews: some View {
        SignView()
    }
}
