//
//  doctorListingCard.swift
//  CareTrack
//
//  Created by weat on 20/04/23.
//

import SwiftUI

struct DoctorListingCard: View {
    @State var customBlue:Color = Color(red: 0, green: 125/255, blue: 254/255)
    var docName: String = ""
    var department: String = ""
    var experience: Int = 0
    let width = (UIScreen.main.bounds.width-32)
    var body: some View {
        ZStack{
            Color(red: 0.949, green: 0.949, blue: 0.949)
                .ignoresSafeArea()
            VStack{
                ZStack{
                    RoundedRectangle(cornerRadius: 30)
                        .frame(width: width,height: 150)
                        .foregroundColor(.white)
                        .shadow(radius: 2)
                    HStack{
                        VStack(alignment: .leading,spacing: 5){
                            Text(docName)
                                .font(Font.custom("SF Pro Display", size: 24))
                                .fontWeight(.bold)
                                .multilineTextAlignment(.leading)
                            Text(department)
                                .font(Font.custom("SF Pro Display", size: 16))
                            Text("Experience : \(experience) years")
                                .font(Font.custom("SF Pro Display", size: 16))
                            Label("4.5", systemImage: "star.fill")
                                .font(Font.custom("SF Pro Display", size: 16))
                        }
                        .padding()
                        Spacer()
                        Image("docImg")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 80, height: 80)
                            .cornerRadius(20)
                            .clipped()
                        
                         Image(systemName: "chevron.right")
                            .resizable()
                            .frame(width: 19,height: 32,alignment: .trailing)
                            .fontWeight(.bold)
                            .padding()
                    }
                    .frame(width: width,alignment: .trailing)
                }

            }
        }
    }
    
}

struct doctorListingCard_Previews: PreviewProvider {
    static var previews: some View {
        DoctorListingCard()
    }
}
