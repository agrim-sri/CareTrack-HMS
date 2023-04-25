//
//  VitalCardsView.swift
//  CareTrack
//
//  Created by Prakhar Parakh on 25/04/23.
//

import SwiftUI

struct VitalCardsView: View {
    var image1: String = ""
    var image2: String = ""
    var heightLabel: String = ""
    var height: String = ""
    var unit1: String = ""
    var weightLabel: String = ""
    var weight: String = ""
    var unit2: String = ""
    
    var body: some View {
        VStack{
            HStack(spacing: -10){
                Image(image1)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 30, height: 30)
                    .padding(.trailing)
                Text(heightLabel)
                    .padding(.trailing)
                    .foregroundColor(.blue)
            }
            
            HStack {
                Text(height)
                    .font(.system(size: 30))
                    .bold()
                    .padding(.leading)
                
                Text(unit1)
                    .foregroundColor(.secondary)
                
                
            }
            
            HStack(spacing: -10){
                Image(image2)
                
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 30, height: 30)
                    .padding(.trailing)
                Text(weightLabel)
                    .padding(.trailing)
                    .foregroundColor(.blue)
            }
            
            HStack {
                Text(weight)
                    .font(.system(size: 30))
                    .bold()
                    .padding(.leading)
                
                Text(unit2)
                    .foregroundColor(.secondary)
            }
        }
        
        //Sans
    }
}

struct VitalCardsView_Previews: PreviewProvider {
    static var previews: some View {
        VitalCardsView()
    }
}
