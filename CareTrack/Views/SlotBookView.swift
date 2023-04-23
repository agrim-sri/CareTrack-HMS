//
//  SlotBookingView.swift
//  CareTrack
//
//  Created by Sanjay Krishna on 20/04/23.
//

import SwiftUI
    // columns for grid
let Columns:[GridItem] = [
    GridItem(.flexible(minimum: 50, maximum: 100),spacing: nil,alignment:nil),
    GridItem(.flexible(minimum: 50,maximum: 100),spacing: nil,alignment: nil),
    GridItem(.flexible(minimum: 50,maximum: 100),spacing:nil,alignment: nil)]

    // create a second Date instance set to one day in seconds from now
    let tomorrow = Date.now.addingTimeInterval(604800)

    // create a range from those two
    let range = Date.now...tomorrow
let colours:[Color] = [.red,.blue,.cyan,.accentColor,.brown,.gray,.indigo,.orange,.mint,.pink,.teal,.yellow]
    

struct SlotBookView: View {
    @State private var appointmentDate = Date()
    let startingDate:Date=Calendar.current.date(from: DateComponents(year: 2023)) ?? Date()
    let endingDate:Date = Date()
    @State var screenWidth = UIScreen.main.bounds.width*0.9
    @State var selectedButton: Int = -1
    var docName: String = ""
    var department: String = ""
    var degree: String = "MD Cardiology"
    var experience: Int = 0
    var body: some View {
        ZStack {
            Color(red: 0.949, green: 0.949, blue: 0.949)
                .ignoresSafeArea()
            VStack{
                Spacer()
                VStack(spacing:5){
                    HStack{
                        VStack{
                            Text(docName)
                                .foregroundColor(.black)
                                .font(Font.custom("SF Pro Display Bold", size: 30))
                            
                                .frame(maxWidth:.infinity,alignment: .leading)
                                .padding(.top)
                                .padding(.leading)
                                .padding(.bottom,3)
                            Text(department)
                                .frame(maxWidth:.infinity,alignment: .leading)
                                .font(Font.custom("SF Pro Display Bold",size:24))
                                .padding(.leading)
                                .padding(.bottom,3)
                            Text(degree)
                                .frame(maxWidth:.infinity,alignment: .leading)
                                .font(Font.custom("SF Pro Display Regular",size:20))
                                .padding(.bottom,3)
                                .padding(.leading)
                            
                            Text("\(experience) Years Of Experience")
                                .frame(maxWidth:.infinity,alignment: .leading)
                                .font(Font.custom("SF Pro Display Regular",size:20))
                                .padding(.leading)
                        }
                        .offset(y: CGFloat(30))
                        Image("docImg")
                            .resizable()
                            .aspectRatio( contentMode: .fit)
                            .frame(width: 150,height: 100,alignment: .trailing)
                            .clipShape(Circle())
                            .padding(.top)
                        
                    }
                    
                    Divider()
                        .padding(.top,35)
                    
                    DatePicker("Select Date For Appointment :",selection: $appointmentDate,in: range,displayedComponents: .date)
                        .padding()
                    HStack{
                        Text("Time Slot Selection")
                            .font(Font.custom("SF Pro Display Regular",size: 24))
                            .frame(maxWidth: .infinity,alignment: .leading)
                            .padding(.top)
                            .padding(.leading)
                    }
                    Spacer()
                        
                    
                    
                }
    //            ZStack{
    //                RoundedRectangle(cornerRadius: 50)
    //                    .stroke(.blue,lineWidth:3)
    //
    //                    .frame(width: screenWidth,height: 250)
    //                    .foregroundColor(.white)
                    LazyVGrid(columns: Columns){
                        ForEach(0..<9){index in
                            
                            Button{
                                selectedButton = index
                            }label: {
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(.blue,lineWidth: 3)
                                    .background(selectedButton == index ? .blue : .white)
                                    .frame(height: 50)
                                    .overlay(
                                        Text("\(index)-\(index+10)")
                                            .foregroundColor(.black)
                                    )
                                    .font(.system(size: 20))
                            }
                            
                        }.padding(.top)
                            .padding(.trailing)
                        
                    }
                    
                    
                //}
                
                HStack{
                    Button() {
                        
                    }label: {
                        Text("Book Slot")
                            .padding(.horizontal,60)
                            .padding(.vertical,8)
                            .foregroundColor(.white)
                            .background(
                            RoundedRectangle(cornerRadius: 8)
                                .fill(.blue)
                            )
                            
                            .overlay {
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(.blue,lineWidth: 2)
                            }
                            
                            
                    }.padding(.top)
                    .buttonStyle(.plain)
                    
                }
                .padding(.bottom,70)
                Spacer()
                 
                
                
                        
                      
                }
                
                
            .padding(.bottom,100)
        }
        }
       
    }



struct SlotBookingView_Previews: PreviewProvider {
    static var previews: some View {
        SlotBookView()
    }
}
