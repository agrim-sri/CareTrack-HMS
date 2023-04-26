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
    @Published var date : Date = Date()
    
}

let booking : Booking = Booking()

struct DoctorLandingPage : View {
    
    @ObservedObject var indexDate = booking

    var body: some View {
        
        ScrollView(.vertical, showsIndicators: true){
            
            // profile page
            ProfileDoctor()
            
            
            // Creating a scroll bar for days to choose from
            makeDates()
            
            // Left
            // Add frame to divider
            Divider()
                .overlay(.black)
            
            // Create Appointments
            DoctorPageAppointments()
            
        }.background().background(Color(#colorLiteral(red: 0.9593991637, green: 0.9593990445, blue: 0.9593991637, alpha: 1)))
    }
}

struct ProfileDoctor : View {
    
    var body : some View{
        
        HStack {
            VStack(alignment: .leading) {
                Text("Welcome,")
                    .font(.title)
                Text("Doctor")
                    .font(.largeTitle)
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
        dateFormatter.dateFormat = "E dd/MM"
        return dateFormatter.string(from: date)
    }
    
    var body : some View{
        
        let heightScreen = bounds.size.height
        let widthScreen = bounds.size.width
        
        ScrollView(.horizontal, showsIndicators: false){
            HStack(spacing : nil){
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
                            Rectangle()
                                .stroke()
                                .frame(width : widthScreen * 0.25, height : heightScreen * 0.15)
                                .overlay(Text(getDay(date: dateAssigned)))
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
                            Rectangle()
                                .foregroundColor(.blue)
                                .frame(width : widthScreen * 0.25, height : heightScreen * 0.15)
                                .overlay(
                                    Text(getDay(date: dateAssigned))
                                        .foregroundColor(.white)
                                )
                        }
                    }
                }
            }
        }
    }
}


struct DoctorPageAppointments : View{
    
    @ObservedObject var indexDate = booking
    
    let colorPatientName = Color(#colorLiteral(red: 0, green: 0.5794375539, blue: 0.9981201291, alpha: 1))
    let schedule : [String] = ["Name 1", "Name 2", "Name 3", "Name 4", "Name 5", "Name 6"]
    
    let timing : [[String]] = [
        ["0", "9:30 AM", "10:00 AM", "10:30 AM", "11:00 AM", "11:30 AM"],
        ["1", "11:30 AM"],
        ["2", "9:30 AM", "10:00 PM", "11:30 AM"],
        ["3"],
        ["4", "9:30 AM", "11:30 AM"],
        ["5", "9:30 AM", "10:00 AM", "11:00 AM", "11:00 PM"],
        ["6", "9:30", "11:00 AM", "11:30 AM"]
    ]
    
    let bounds = UIScreen.main.bounds
    
    
    var body : some View{
        
        let heightScreen = bounds.size.height
        let widthScreen = bounds.size.width
        let numberOfSchedules : Int = timing[booking.index].count
    
        LazyVStack(){
            
            ForEach(0..<numberOfSchedules, id : \.self){ index in
                
                HStack{
                    Rectangle()
                        .frame(width: widthScreen * 0.25, height : heightScreen * 0.10)
                        .foregroundColor(.white)
                        .overlay(
                            Text(timing[indexDate.index][index]),
                            alignment: .center
                        )
                        .opacity(0.5)
                    
                    Button {
                        
                        // action to be defined
                        
                        
                        
                    } label: {
                        RoundedRectangle(cornerRadius: 28)
                            .foregroundColor(colorPatientName)
                            .overlay(
                                Text(schedule[index])
                                    .foregroundColor(.white)
                                    .fontWeight(.semibold)
                                ,
                                alignment: .center
                            )
                    }

                }
                
                Divider()
                    .overlay(.black)
                
            }
        }.gesture(DragGesture(minimumDistance: 3.0, coordinateSpace: .local)
            .onEnded { value in
                print(value.translation)
                switch(value.translation.width, value.translation.height) {
                    case (...0, -30...30):
                    indexDate.index = min(0, indexDate.index - 1)
                    case (0..., -30...30):
                    indexDate.index = max(6, indexDate.index + 1)
                    default: print("no clue")
                }
            }
        )
    }
}

struct DoctorLandingPage_Previews: PreviewProvider {
    static var previews: some View {
        DoctorLandingPage()
    }
}
