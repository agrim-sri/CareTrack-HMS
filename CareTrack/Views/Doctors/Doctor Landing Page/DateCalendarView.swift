//
//  DateCalendarView.swift
//  CareTrack
//
//  Created by weat on 27/04/23.
//

import SwiftUI

class Booking : ObservableObject{
    @Published var index : Int = 0
    @Published var date : Date = Date()
    
}

let booking : Booking = Booking()

struct DateCalendarView: View {
    
    //    #A1A8B0
    @State var dayColor:Color = Color(red: 161/255, green: 168/255, blue: 176/255)
    //     #101623
    @State var dateColor:Color = Color(red: 16/255, green: 22/255, blue: 35/255)
    
    func dateGetter(index : Int) -> Date{
        return Calendar.current.date(byAdding: .day, value: index, to: Date())!
    }
    @State var bgColor:Color = Color(red: 242/255, green: 242/255, blue: 242/255)
    @State var symptomsColor:Color = Color(red: 157/255, green: 159/255, blue: 159/255)
    @State var timeArray:[String] = ["10:00","10:30","11:00","11:30","12:00","5:00","5:30","6:00","6:30","7:00"]
    
    @State var headingColor:Color = Color(red: 28/255, green: 28/255, blue: 28/255)
    @StateObject var DoctorLandingViewModel = DoctorLandingPageViewModel()

    
    func getDay(date : Date) -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "E"
        return dateFormatter.string(from: date)
    }
    func getDate(date : Date) -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd"
        return dateFormatter.string(from: date)
    }
    @ObservedObject var indexDate = booking
    let columns : [GridItem] = [GridItem(.fixed(UIScreen.screenWidth * 0.3)),
                                GridItem(.flexible())
    ]
    @StateObject var temp = Booking()
    var body: some View {
        ScrollView(.horizontal,showsIndicators: false){
            HStack{
                ForEach(0..<7){ i in
                    
                    let date = dateGetter(index: i)
                    if i != indexDate.index{
                        Button {
                            withAnimation {
                                indexDate.index = i
                            }
                            temp.date = date
                            
                            print(temp.date)
                            
                        } label: {
                            VStack{
                                Text((getDay(date: date)))
                                    .font(Font.custom("SF Pro Display Regular", size: 16))
                                    .foregroundColor(dayColor)
                                
                                
                                Text((getDate(date: date)))
                                    .font(Font.custom("SF Pro Display ", size: 18))
                                    .foregroundColor(dateColor)
                            }.frame(alignment: .center)
                                .padding(.leading)
                            
                                .background{
                                    RoundedRectangle(cornerRadius: 15)
                                        .frame(width:64,height: 80)
                                        .foregroundColor(.white)
                                        .padding(.leading)
                                }
                                .padding()
                        }
                        
                    }
                    else{
                        Button {
                            withAnimation {
                                indexDate.index = i
                            }
                            
                        } label: {
                            VStack{
                                Text((getDay(date: date)))
                                    .font(Font.custom("SF Pro Display Regular", size: 16))
                                    .foregroundColor(.white)
                                
                                Text((getDate(date: date)))
                                    .font(Font.custom("SF Pro Display ", size: 18))
                                    .foregroundColor(.white)
                            }.frame(alignment: .center)
                                .padding(.leading)
                                .background{
                                    RoundedRectangle(cornerRadius: 15)
                                        .frame(width:64,height: 80)
                                        .foregroundColor(.blue)
                                        .padding(.leading)
                                }
                                .padding()
                        }
                    }
                }
            }
            .frame(height: 85)
            .padding(.bottom)
            .padding(.trailing,16)
            Divider()
        }
        LazyVGrid(columns: columns){
            ForEach(0..<DoctorLandingViewModel.appoitementDetails.count, id: \.self){ index in
                
                if(Foundation.Date(milliseconds: Int64(DoctorLandingViewModel.appoitementDetails[index].date)).formatted(date: .abbreviated, time: .omitted) == temp.date.formatted(date: .abbreviated, time: .omitted)){
                    
                    Text("\(DoctorLandingViewModel.appoitementDetails[index].time)" as String)
                        .padding()
                        .font(Font.custom("SF Pro Display Regular", size: 18))
                        .foregroundColor(headingColor)
                        .background{
                            RoundedRectangle(cornerRadius: 15)
                                .foregroundColor(.white)
                                .frame(width:87,height:96)
                        }
                        .padding()
                    
                    NavigationLink(destination: DoctorPrescriptionForm(patientId: DoctorLandingViewModel.appoitementDetails[index].patientId,patientName:DoctorLandingViewModel.appoitementDetails[index].patientName)) {
                        HStack{
                            VStack(alignment: .leading,spacing: 5){
                                Text("\(DoctorLandingViewModel.appoitementDetails[index].patientName)" as String)
                                    .frame(maxWidth: .infinity,alignment: .leading)
                                    .font(Font.custom("SF Pro Display Semibold", size: 16))
                                    .foregroundColor(headingColor)
                                Text("Sick")
                                    .font(Font.custom("SF Pro Display Medium", size: 12))
                                    .foregroundColor(symptomsColor)
                                    
                                    Text("\(Foundation.Date(milliseconds: Int64(DoctorLandingViewModel.appoitementDetails[index].date)).formatted(date: .complete, time: .omitted))")
                                      .font(Font.custom("SF Pro Display Medium", size: 12))
                                        .foregroundColor(headingColor)
                                
                                
                            }.padding()
                            
                            Image(systemName: "chevron.right")
                                .padding(.trailing)
                                .font(Font.custom("SF Pro Display Semibold", size: 24))
                                .foregroundColor(.blue)
                        }
                        
                        .background{
                            RoundedRectangle(cornerRadius: 15)
                                .foregroundColor(.white)
                        }
                        .padding()
                    }
                    
                }
                
                
                
                
                
                
            }
        }
        .task {
            await DoctorLandingViewModel.getAppoitementDeatils()
        }

    }
    
    
}

struct DateCalendarView_Previews: PreviewProvider {
    static var previews: some View {
        DateCalendarView()
    }
}

