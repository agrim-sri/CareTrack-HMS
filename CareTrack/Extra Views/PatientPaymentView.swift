//
//  PatientPaymentView.swift
//  CareTrack
//
//  Created by Sanskriti Sinha on 21/04/23.
 
import SwiftUI

struct PatientPaymentView: View {
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.blue)
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width)
                .offset(x: 0, y: -UIScreen.main.bounds.width / 1)
             
            VStack {
                
                Text("Payment Details")
                    .foregroundColor(.white)
                    .font(Font.custom("Archivo", size: 35))
                    .bold()
                
                VStack(alignment: .leading, spacing: 20){
                    HStack{
                        Text("Base Price")
                        Spacer()
                        Text("500")
                    }
                    .padding(.leading)
                    .padding(.trailing)
                    
                    HStack{
                        Text("Tax")
                        Spacer()
                        Text("90")
                    }
                    .padding(.leading)
                    .padding(.trailing)
                    
                    HStack{
                        Text("Total Cost")
                        Spacer()
                        Text("590")
                    }
                    .padding(.leading)
                    .padding(.trailing)
                }
                .font(Font.custom("Archivo", size: 24))
                .padding(.top, 150)
                
                VStack{
                    VStack{
                        Text("Booking Details")
                            .font(Font.custom("Archivo", size: 38))
                            .bold()
                            .padding(.trailing, 110)
                            .padding(.top, 20)
                    }
                    
                    Divider()
                        .frame(height: 1)
                        .overlay(.black)
                        .padding(.all)
                        .padding(.bottom)
                        
                    
                    VStack(alignment: .leading, spacing: 25){
                        HStack{
                            Text("Doctor Name")
                            Spacer()
                            Text("Dr. Smriti Gupta")
                        }
                        .padding(.leading)
                        .padding(.trailing)
                        
                        HStack{
                            Text("Date")
                            Spacer()
                            Text("20 April 2023")
                        }
                        .padding(.leading)
                        .padding(.trailing)
                        
                        HStack{
                            Text("Time")
                            Spacer()
                            Text("1:30")
                        }
                        .padding(.leading)
                        .padding(.trailing)
                    }
                    .font(Font.custom("Archivo", size: 24))
                    
                    
                    Button {
                        
                    } label: {
                        RoundedRectangle(cornerRadius: 20)
                            .frame(width: 120, height: 50)
                            .overlay{
                                Text("Pay Now")
                                    .foregroundColor(.white)
                                    .font(Font.custom("Archivo", size: 20))
                                    .bold()
                            }
                        
                    }.padding(.top, 50)

                    
                }
            }
            
            
            
        }
    }
}

struct PatientPaymentView_Previews: PreviewProvider {
    static var previews: some View {
        PatientPaymentView()
    }
}
