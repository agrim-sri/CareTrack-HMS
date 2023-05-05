//
//  BookingReviewView.swift
//  CareTrack
//
//  Created by Prakhar Parakh on 24/04/23.
//

import SwiftUI
import FirebaseAuth

struct PaymentPreviewView: View {
    //     #F2F2F2
        @State var bgColor:Color = Color(red: 242/255, green: 242/255, blue: 242/255)
        // #1C1C1C
        @State var headingColor:Color = Color(red: 28/255, green: 28/255, blue: 28/255)
    //    #A1A8B0
        @State var dayColor:Color = Color(red: 161/255, green: 168/255, blue: 176/255)
//     #9D9F9F
    @State var grayColor :Color = Color(red: 157/255, green: 159/255, blue: 159/255)
    
//  #555555
    @State var dateColor :Color = Color(red: 85/255, green: 85/255, blue: 85/255)
    
//    #A1A8B0
    @State var secondaryGrey:Color = Color(red: 161/255, green: 168/255, blue: 176/255)
//      #101623
    @State var amountColor:Color = Color(red: 16/255, green: 22/255, blue: 35/255)
//    #E09F1F
    @State var starYellow:Color = Color(red: 224/255, green: 159/255, blue: 31/255)
    var docID: String = ""
    var name: String = ""
    var dept: String = ""
    var time: String = ""
    var date: Date = Date()
    @State var showSuccessOnPayment: Bool = false
    @StateObject var slotBookingVM = SlotBookViewModel()
    @StateObject var userVM = PatientDashboardViewModel()
    var body: some View {
        ZStack{
            Color(red: 0.949, green: 0.949, blue: 0.949)
                .ignoresSafeArea()
            
            ScrollView {
                VStack{
                    
                    HStack{
                        VStack(alignment: .leading,spacing: 15){
                            Text(name)
                                .font(Font.custom("SF Pro Display Bold", size: 20))
                                .foregroundColor(headingColor)
                                .padding(.top)
                            Text(dept)
                                .font(Font.custom("SF Pro Display Regular", size: 16))
                                .foregroundColor(grayColor)
                            Label("4.5", systemImage: "star.fill")
                                .font(Font.custom("SF Pro Display Bold", size: 16))
                                .foregroundColor(starYellow)
                                .padding(.bottom)
                                .font(Font.custom("SF Pro Display Bold", size: 16))
                                .foregroundColor(headingColor)
                        }.padding(.leading)
                        Spacer()
                        Image("Profile Image")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 90, height: 90)
                            .padding(.trailing)
                    }.background{
                        RoundedRectangle(cornerRadius: 20)
                            .foregroundColor(.white)
                    }
                    .padding()
                    
                    Text("Date")
                        .font(Font.custom("SF Pro Display Semibold", size: 16))
                        .foregroundColor(headingColor)
                        .frame(maxWidth: .infinity,alignment: .leading)
                        .padding(.leading)
                    
                    HStack{
                        Image(systemName: "calendar.circle.fill")
                            .resizable()
                            .foregroundColor(.blue)
                            .frame(width: 30,height: 30)
                            .padding(.leading)
                        Spacer()
                        Text("\(date.formatted(date: .complete, time: .omitted)) | \(time):00")
                            .font(Font.custom("SF Pro Display Semibold", size: 14))
                            .foregroundColor(dateColor)
                            .padding(.top)
                            .padding(.bottom)
                            .padding(.trailing)

                    }.background{
                        RoundedRectangle(cornerRadius: 20)
                            .foregroundColor(.white)
                    }
                    .padding()
                    
                    Text("Payment Detail")
                        .font(Font.custom("SF Pro Display Semibold", size: 16))
                        .foregroundColor(headingColor)
                        .frame(maxWidth: .infinity,alignment: .leading)
                        .padding(.leading)
                    
                    HStack{
                        VStack(alignment: .leading, spacing: 15){
                            Text("Counsultation")
                                .font(Font.custom("SF Pro Display Semibold", size: 16))
                                .foregroundColor(secondaryGrey)
                                .padding(.top)
                            Text("Admin Fee")
                                .font(Font.custom("SF Pro Display Semibold", size: 16))
                                .foregroundColor(secondaryGrey)
                            Text("Additional Discount")
                                .font(Font.custom("SF Pro Display Regular", size: 14))
                                .foregroundColor(secondaryGrey)
                            Text("Total")
                                .font(Font.custom("SF Pro Display Semibold", size: 16))
                                .foregroundColor(headingColor)
                                .padding(.bottom)

                        }.padding(.leading)
                        Spacer()
                        VStack(spacing: 15){
                            Text("₹600.00")
                                .font(Font.custom("SF Pro Display Regular", size: 14))
                                .foregroundColor(amountColor)
                                .padding(.top)
                            Text("₹600.00")
                                .font(Font.custom("SF Pro Display Regular", size: 14))
                                .foregroundColor(amountColor)
                            Text("-")
                                .font(Font.custom("SF Pro Display Regular", size: 14))
                                .foregroundColor(amountColor)
                            Text("₹1200.00")
                                .font(Font.custom("SF Pro Display Bold", size: 16))
                                .foregroundColor(headingColor)
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
                                .font(Font.custom("SF Pro Display Medium", size: 14))
                                .foregroundColor(headingColor)
                            Text("₹120.00")
                                .font(Font.custom("SF Pro Display Semibold", size: 18))
                                .foregroundColor(headingColor)
                        }.padding(.leading)
                        
                        Spacer()
                        Button {
                            showSuccessOnPayment.toggle()
                            slotBookingVM.addData(doctorId: docID, patientId: Auth.auth().currentUser!.uid,doctorName: name, department: dept, patientName: userVM.user[0].name, Date: date, slots: time)
                        } label: {
                            Text("Book Now")
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
            if showSuccessOnPayment{
                PaymentConfirmedCardView()
                    .animation(.easeIn(duration: 2), value: showSuccessOnPayment)
            }
        }.navigationTitle("Confirm Appointment")
            .task {
                userVM.getUser()
            }
        
    }
}

struct BookingReviewView_Previews: PreviewProvider {
    static var previews: some View {
        PaymentPreviewView()
    }
}

