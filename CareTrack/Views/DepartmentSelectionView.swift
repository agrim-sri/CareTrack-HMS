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
    
    let dict: [String : String] = ["Surgery" : "Surgery",
                                   "Neurology" : "Neurology",
                                   "General" : "General"
    ]
    
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
                        ForEach(dict.sorted(by: >), id: \.key){key,value in
                            NavigationLink(destination: DoctorSelectionView()) {
                                VStack{
                                    Image(value)
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)

                                        .frame(width: UIScreen.screenWidth * 0.3)
                                    Text(key)
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
                        
                    }
                    Spacer()
                }

            }.navigationTitle(Text("Book Appointment"))
                
        }.searchable(text: $search)
    }
    var searchResults: [String: String] {
            if search.isEmpty {
                return dict
            } else {
                return dict.filter {$0.key.contains(search) }
            }
        }
}

struct DepartmentSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        DepartmentSelectionView()
    }
}
