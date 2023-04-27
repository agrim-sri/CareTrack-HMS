//
//  DoctorLandingPage.swift
//  CareTrack
//
//  Created by Tanmay Sharma on 25/04/23.
//

import SwiftUI

extension Animation {
    static func ripple(index: Int) -> Animation {
        Animation.spring(dampingFraction: 0.5)
            .speed(2)
            .delay(0.03 * Double(index))
    }
}

class Booking : ObservableObject{
    @Published var index : Int = 0
    @Published var isDoctor : Int = 0
    
}

let booking : Booking = Booking()

struct DoctorLandingPage : View {
    
    @ObservedObject var indexDate = booking

    var body: some View {
        
        ScrollView(.vertical, showsIndicators: true){
            
            // profile page
            ProfileDoctor()
            
            Text("Upcoming Appointments")
                .frame(maxWidth : .infinity, alignment: .leading)
                .padding(.horizontal)
            
            
            
            // Creating a scroll bar for days to choose from
            makeDates()
            
            VStack{
                Divider()
                    .opacity(0)
                HStack {
                    Picker(selection: $indexDate.isDoctor, label: Text("Left Column")) {
                        Text("Upcoming")
                            .tag(0)
                        Text("Completed")
                            .tag(1)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
            }
            .padding(.horizontal)
        
            
            // Create Appointments
            DoctorPageAppointments()
            
        }.background(Color(#colorLiteral(red: 0.9593991637, green: 0.9593990445, blue: 0.9593991637, alpha: 1)))
    }
}

struct ProfileDoctor : View {
    
    var body : some View{
        
        HStack {
            VStack(alignment: .leading) {
                Text("Hello 👋,")
                    .font(.title)
                Text("Dr. Gaurav Ganju")
                    .font(.title)
                    .fontWeight(.bold)
            }.padding(.horizontal)
            
            Spacer()
            
            Image(systemName: "person.circle")
                .resizable()
                .frame(width: 80, height: 80)
                .foregroundColor(.blue)
            
            

        }
        .padding()
        Spacer()
    }
}


struct makeDates : View{
    
    @ObservedObject var indexDate = booking
    
    let bounds = UIScreen.main.bounds
    
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
    
    var body : some View{
        
        ScrollView(.horizontal, showsIndicators: false){
            HStack(spacing : 16){
                ForEach(0..<7){ index in
                    
                    let dateAssigned = dateGetter(index: index)
                    
                    if index != indexDate.index{
                        Button{
                            // send the call to get the appointments
                            print("button \(index) pressed")
                            withAnimation {
                                indexDate.index = index
                            }
                            
                        } label:{
                            RoundedRectangle(cornerRadius: 14)
                                .foregroundColor(.white)
                                .frame(width : 56 , height : 65)
                                .overlay(
                                    VStack{
                                        Text(getDay(date: dateAssigned))
                                            .foregroundColor(Color(#colorLiteral(red: 0.6916636825, green: 0.7169430852, blue: 0.7440057993, alpha: 1)))
                                            .font(.caption)
                                        Text(getDate(date: dateAssigned))
                                            .foregroundColor(.black)
                                    }
                                )
                        }
                    }
                    else{
                        Button{
                            // send the call to get the appointments
                            print("button \(index) pressed")
                            withAnimation {
                                indexDate.index = index
                            }
                            
                        } label:{
                            RoundedRectangle(cornerRadius: 14)
                                .foregroundColor(.blue)
                                .frame(width : 56 , height : 65)
                                .overlay(
                                    VStack{
                                        Text(getDay(date: dateAssigned))
                                            .foregroundColor(Color(#colorLiteral(red: 0.6916636825, green: 0.7169430852, blue: 0.7440057993, alpha: 1)))
                                            .font(.caption)
                                        Text(getDate(date: dateAssigned))
                                            .foregroundColor(.white)
                                    }
                                )
                        }
                    }
                }
            }
        }.padding(.horizontal)
    }
}


struct DoctorPageAppointments : View{
    
    @ObservedObject var indexDate = booking
    
    func getDate(date : Date) -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "E, d MMM, yyyy"
        return dateFormatter.string(from: date)
    }
    
    let colorPatientName = Color(#colorLiteral(red: 0, green: 0.5794375539, blue: 0.9981201291, alpha: 1))
    let schedule : [String] = ["Name 1", "Name 2", "Name 3", "Name 4", "Name 5", "Name 6"]
    
    let timing : [[String]] = [
        ["9:30", "10:00", "10:30", "11:00", "11:30"],
        ["11:30"],
        ["9:30", "10:00", "11:30"],
        ["11:30"],
        ["9:30", "11:30"],
        ["9:30", "10:00", "11:00", "11:30"],
        ["9:30", "11:00", "11:30"]
    ]
    
    let bounds = UIScreen.main.bounds
    
    
    var body : some View{
        
        let heightScreen = bounds.size.height
        let widthScreen = bounds.size.width
        let numberOfSchedules : Int = timing[booking.index].count
    
        LazyVStack(){
            
            ForEach(0..<numberOfSchedules, id : \.self){ index in
                
                let currState : Bool = (index == 0)
                
                HStack{
                    RoundedRectangle(cornerRadius: 20)
                        .frame(width: widthScreen * 0.25, height : heightScreen * 0.10)
                        .foregroundColor(currState ? colorPatientName : Color.white)
                        .overlay(
                            VStack{
                                
                                Text(timing[indexDate.index][index])
                                    .foregroundColor(currState ? Color.white : Color.black)
                                
                                Text("AM")
                                    .foregroundColor(currState ? Color.white : Color.black)
                                
                            }
                            ,
                            alignment: .center
                        )
                    
                    Button {
                        
                        // action to be defined
                        
                        
                        
                    } label: {
                        RoundedRectangle(cornerRadius: 28)
                            .foregroundColor(currState ? colorPatientName : Color.white)
                            .overlay(
                                HStack{
                                    VStack(alignment: .leading){
                                        Text(schedule[index])
                                            .foregroundColor(currState ? Color.white : Color.black)
                                            .fontWeight(.semibold)
                                            .font(.title3)
                                        Text("Food Poisioning")
                                            .foregroundColor(.black)
                                            .font(.caption)
                                            .opacity(0.5)
                                        Text(getDate(date: Date()))
                                            .foregroundColor(currState ? Color.white : Color.black)
                                            .font(.subheadline)
                                    }.padding()
                                    
                                    Spacer()
                                     
                                    Image(systemName: "greaterthan")
                                        .resizable()
                                        .frame(width: 20, height: 20)
                                        .foregroundColor(currState ? colorPatientName : Color.black)
                                        .padding()
                                        .padding(.horizontal)
                                    
                                }
                                ,
                                alignment: .center
                            )
                    }

                }.padding(.vertical, 10)
                
            }
        }.padding(.horizontal)
    }
}

struct DoctorLandingPage_Previews: PreviewProvider {
    static var previews: some View {
        DoctorLandingPage()
    }
}
