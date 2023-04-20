//
//  SlotBookingView.swift
//  CareTrack
//
//  Created by Sanjay Krishna on 20/04/23.
//

import SwiftUI

struct SlotBookingView: View {
    var body: some View {
        VStack{
            Spacer()
            VStack(spacing:5){
                HStack{
                    Text("Dr Mohan Kakkar")
                        .foregroundColor(.black)
                        .font(Font.custom("SF Pro Display Heavy", size: 25))
                        .fontWeight(.heavy)
                        .frame(maxWidth:.infinity,alignment: .leading)
                        .padding(.top)
                        .padding(.leading)
                        //.padding(.bottom)
                    Image("doctor-mock")
                        .resizable()
                        .aspectRatio( contentMode: .fit)
                        .frame(width: 100,height: 100,alignment: .trailing)
                        .padding(.trailing)
                        .padding(.top)
                        
                }
                
                Text("Cardiology")
                    .frame(maxWidth:.infinity,alignment: .leading)
                    .font(.system(size: 20))
                    .padding(.leading)
                Text("MD Cardiology")
                    .frame(maxWidth:.infinity,alignment: .leading)
                    .font(.system(size: 20))
                    .padding(.leading)
                Text("15 Years Of Experienece")
                    .frame(maxWidth:.infinity,alignment: .leading)
                    .font(.system(size: 20))
                    .padding(.leading)
                
                Spacer()
            }
        
        }
       
    }
}

struct SlotBookingView_Previews: PreviewProvider {
    static var previews: some View {
        SlotBookingView()
    }
}
