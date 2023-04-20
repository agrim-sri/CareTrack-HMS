//
//  DepartmentSelectionView.swift
//  CareTrack
//
//  Created by Prakhar Parakh on 19/04/23.
//

import SwiftUI

extension UIScreen{
   static let screenWidth = UIScreen.main.bounds.size.width
   static let screenHeight = UIScreen.main.bounds.size.height
   static let screenSize = UIScreen.main.bounds.size
}

struct DepartmentSelectionView: View {
    let imageData: [String] = ["Surgery", "Neurology", "General","Surgery", "Neurology", "General","Surgery", "Neurology", "General","Surgery", "Neurology", "General","Surgery", "Neurology", "General","Surgery", "Neurology", "General","Surgery", "Neurology", "General","Surgery", "Neurology", "General"]
    let imageText: [String] = ["Surgery", "Neurology", "General","Surgery", "Neurology", "General","Surgery", "Neurology", "General","Surgery", "Neurology", "General","Surgery", "Neurology", "General","Surgery", "Neurology", "General","Surgery", "Neurology", "General","Surgery", "Neurology", "General"]
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())

    ]
    @State var search: String = ""
    var body: some View {
        NavigationView{
            ScrollView(showsIndicators: false) {
                VStack{
                    
                    Text("Departments")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading)
                        .font(Font.custom("SF Pro Display Semibold", size: 16))
                        .padding(.top)
                    LazyVGrid(columns: columns) {
                        ForEach(0..<imageData.count, id: \.self){j in
                            VStack{
                                Image(imageData[j])
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)

                                    .frame(width: UIScreen.screenWidth * 0.3)
                                Text(imageText[j])
                                    .font(Font.custom("SF Pro Display Semibold", size: 16))
                            }
                            .background {
                                RoundedRectangle(cornerRadius: 15)
                                    .foregroundColor(.white)
                                    .shadow(radius: 3)
                            }
                            .padding(.leading)
                            .padding(.trailing)
                            
                        }
                        
                    }
                    Spacer()
                }

            }.navigationTitle(Text("Book Appointment"))
                
        }.searchable(text: $search)
    }
}

struct DepartmentSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        DepartmentSelectionView()
    }
}
