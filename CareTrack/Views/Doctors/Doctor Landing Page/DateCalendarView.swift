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
                                    }
                                }

                                struct DateCalendarView_Previews: PreviewProvider {
                                    static var previews: some View {
                                        DateCalendarView()
                                    }
                                }
