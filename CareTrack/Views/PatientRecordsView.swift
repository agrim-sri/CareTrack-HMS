//
//  PatientRecordsView.swift
//  CareTrack
//
//  Created by Zeal Shah  on 20/04/23.
//

import SwiftUI

struct PatientRecordsView: View {
    let datesarray: [String] = ["11/02/2023","20/11/2022","30/11/2022"]
    let docname:[String] = ["Dr. Aryan","Dr. Mim","Dr. Khanna"]
    let depname: [String] = ["Cardiology","Physician","Radiology"]
    var body: some View {
        
        ScrollView(showsIndicators: false){
            VStack{
                Text("Records")
                    .font(Font.custom("SF Pro Display Semibold", size: 32))
                    .frame(maxWidth: .infinity,alignment: .leading)
                    .padding(.leading)
                ForEach(0..<depname.count){ i in
                    HStack{
                        VStack(alignment: .leading,spacing:15){
                            Text("Date: \(datesarray[i])")
                                .font(Font.custom("SF Pro Display Bold", size: 28))
                                .foregroundColor(.white)
                            Text(docname[i])
                                .font(Font.custom("SF Pro Display Semibold", size: 24))
                                .foregroundColor(.white)
                                .padding(.top)

                            Text(depname[i])
                                .font(Font.custom("SF Pro Display Light", size: 24))
                                .foregroundColor(.white)

                            
                        }.padding()
                            .padding(.leading)
                        Spacer()
                        Image(systemName: "chevron.right")
                            .foregroundColor(.white)
                            .padding()
                            .padding(.trailing)
                    }
                    .background{
                        RoundedRectangle(cornerRadius: 20)
                            .fill(.blue)
                            .frame(width: UIScreen.screenWidth - 32)
                    }
                }
                Spacer()
                
            }
        }
    }
}

struct PatientRecordsView_Previews: PreviewProvider {
    static var previews: some View {
        PatientRecordsView()
    }
}
