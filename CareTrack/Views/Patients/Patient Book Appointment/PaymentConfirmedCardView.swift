//
//  PaymentConfirmedCardView.swift
//  CareTrack
//
//  Created by Sanskriti Sinha on 25/04/23.
//

import SwiftUI

struct PaymentConfirmedCardView: View {
    
    @State var blurAmount = 2.5
    
    var body: some View {
        ZStack {
            
            VStack{
                
                PaymentPreviewView()
                    .blur(radius: blurAmount)
            }
            
            RoundedRectangle(cornerRadius: 30.0)
                .frame(width: 300, height: 400)
                .foregroundColor(.white)
                .shadow(radius: 10.0)
                .overlay{
                    VStack{
                        Image("BookingConfirmed")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .padding(.bottom)
                            .padding(.top)
                            .padding(.top)
                            
                        
                        Text("Booking Successfully")
                            .bold()
                            .padding(.top)
                            .padding(.bottom)
                        
                        VStack(alignment: .center) {
                            Text("Your booking has been sucessful, You can have a consulation session with your trusted doctor")
                                .foregroundColor(.secondary)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .multilineTextAlignment(.center )
                                
                        }
                        
                        Button {
                            SlotBookView()
                        } label: {
                            RoundedRectangle(cornerRadius: 25.0)
                                .frame(width: 120, height: 50)
                                .overlay{
                                    Text("Continue")
                                        .bold()
                                        .foregroundColor(.white)
                                }
                            
                                
                        }.padding(.bottom)
                            .padding(.bottom)

                    }
                }
        }
        
    }
}

struct PaymentConfirmedCardView_Previews: PreviewProvider {
    static var previews: some View {
        PaymentConfirmedCardView()
    }
}
