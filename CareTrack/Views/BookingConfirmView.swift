//
//  BookingReviewView.swift
//  CareTrack
//
//  Created by Prakhar Parakh on 24/04/23.
//

import SwiftUI

struct BookingConfirmView: View {
    var name: String = ""
    var dept: String = ""
    var body: some View {
        ZStack{
            Color(red: 0.949, green: 0.949, blue: 0.949)
                .ignoresSafeArea()
            
            ScrollView {
                VStack{
                    
                    HStack{
                        VStack(alignment: .leading,spacing: 15){
                            Text(name)
                                .padding(.top)
                            Text(dept)
                            Label("4.5", systemImage: "star.fill")
                                .padding(.bottom)
                        }.padding(.leading)
                        Spacer()
                        Image("Profile Image")
                            .padding(.trailing)
                    }.background{
                        RoundedRectangle(cornerRadius: 20)
                            .foregroundColor(.white)
                    }
                    .padding()
                    
                    Text("Date")
                        .frame(maxWidth: .infinity,alignment: .leading)
                        .padding(.leading)
                    
                    HStack{
                        Image(systemName: "calendar.circle.fill")
                            .resizable()
                            .foregroundColor(.blue)
                            .frame(width: 30,height: 30)
                            .padding(.leading)
                        Text("Wednesday, Jun 23,2023 | 10:00 AM")
                            .padding(.top)
                            .padding(.bottom)
                            .padding(.trailing)

                    }.background{
                        RoundedRectangle(cornerRadius: 20)
                            .foregroundColor(.white)
                    }
                    .padding()
                    
                    Text("Payment Detail")
                        .frame(maxWidth: .infinity,alignment: .leading)
                        .padding(.leading)
                    
                    HStack{
                        VStack(alignment: .leading, spacing: 15){
                            Text("Counsultation")
                                .padding(.top)
                            Text("Admin Fee")
                            Text("Additional Discount")
                            Text("Total")
                                .padding(.bottom)

                        }.padding(.leading)
                        Spacer()
                        VStack(spacing: 15){
                            Text("$60.00")
                                .padding(.top)
                            Text("$60.00")
                            Text("-")
                            Text("$120.00")
                                .padding(.bottom)

                        }.padding(.trailing)
                    }.background{
                        RoundedRectangle(cornerRadius: 20)
                            .foregroundColor(.white)
                    }
                    .padding()
                    
                    Text("Payment Method")
                        .frame(maxWidth: .infinity,alignment: .leading)
                        .padding(.leading)
                    
                    HStack{
                        Text("Cash")
                            .padding(.leading)
                            .padding(.top)
                            .padding(.bottom)

                        Spacer()
                        Text("Change")
                            .padding(.trailing)
                            .padding(.top)
                            .padding(.bottom)
                    }.background{
                        RoundedRectangle(cornerRadius: 20)
                            .foregroundColor(.white)
                    }
                    .padding()
                    
                    HStack{
                        VStack{
                            Text("Total")
                            Text("$120.00")
                        }.padding(.leading)
                        
                        Spacer()
                        Button{
                            
                        }label: {
                            Text("Pay Now")
                                .padding()
                                .foregroundColor(.white)
                                .background{
                                    RoundedRectangle(cornerRadius: 15)
                                        .fill(.blue)
                                        .frame(width: 150)
                                }
                                .padding()
                                .padding(.trailing)
                        }
                    }
                }
            }
        }.navigationTitle("Confirm Appointment")
    }
}

struct BookingReviewView_Previews: PreviewProvider {
    static var previews: some View {
        BookingConfirmView()
    }
}
