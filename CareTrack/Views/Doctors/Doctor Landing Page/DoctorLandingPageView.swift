//
//  DoctorLandingPage.swift
//  CareTrack
//
//  Created by weat on 26/04/23.
//

import SwiftUI

struct DoctorLandingPageView: View {
    
    @State private var favoriteColor = "Upcoming"
        var colors = ["Upcoming", "Completed"]
    
//     #F2F2F2
    @State var bgColor:Color = Color(red: 242/255, green: 242/255, blue: 242/255)
    // #1C1C1C
    @State var headingColor:Color = Color(red: 28/255, green: 28/255, blue: 28/255)
//    #A1A8B0
    @State var dayColor:Color = Color(red: 161/255, green: 168/255, blue: 176/255)
//     #101623
    @State var dateColor:Color = Color(red: 16/255, green: 22/255, blue: 35/255)
// time array
    @State var timeArray:[String] = ["10:00","10:30","11:00","11:30","12:00","5:00","5:30","6:00","6:30","7:00"]
    
    @StateObject var DoctorLandingViewModel = DoctorLandingPageViewModel()
    @StateObject var prescriptionVM = PrescriptionViewModel()
    var body: some View {
        NavigationView {
            ZStack{
                bgColor
                    .ignoresSafeArea()
                ScrollView{
                    VStack{
                        HStack{
                            VStack(alignment:.leading,spacing:15){
                                Text("Hello 👋")
                                    .font(Font.custom("SF Pro Display Regular", size: 20))
                                    .foregroundColor(headingColor)
                                
                                if DoctorLandingViewModel.doctorDetail.count > 0 {
                                    Text("\(DoctorLandingViewModel.doctorDetail["name"]!)" as String)
                                        .font(Font.custom("SF Pro Display Heavy", size: 32))
                                        .foregroundColor(headingColor)
                                        
                                    
                                }
                                    
                                
                                
                                
                                
                                
                            }.padding(.leading)
                            Spacer()
                            Image("DoctorAvatar")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 150,height: 150)
                                .padding(.trailing)
                        }.padding(.bottom)
                        
                        VStack{
                            
                            Text("Upcoming Appointments")
                                .font(Font.custom("SF Pro Display Semibold", size: 16))
                                .frame(maxWidth: .infinity,alignment: .leading)
                                .padding(.leading,16)
                                .foregroundColor(headingColor)
                            
                            Text("26/04/2023")
                                .font(Font.custom("SF Pro Display Semibold", size: 14))
                                .frame(maxWidth: .infinity,alignment: .leading)
                                .padding(.leading,18)
                                .foregroundColor(headingColor)
                                .padding([.top,.bottom],5)
                            
                            DateCalendarView()
                        
                        }
                        
//                        VStack {
//                                Picker(" ", selection: $favoriteColor) {
//                                    ForEach(colors, id: \.self) {
//                                        Text($0)
//                                    }
//                                }
//                                .pickerStyle(.segmented)
//
//                                Text("Value: \(favoriteColor)")
//                            }
//                        .padding()
                        

                        
                    }
                    .foregroundColor(bgColor)
                }
            }
            .task {
                prescriptionVM.getUser()
                DoctorLandingViewModel.getDoctorData()

        }
        }
    }

}

struct DoctorLandingPage_Previews: PreviewProvider {
    static var previews: some View {
        DoctorLandingPageView()
    }
}

