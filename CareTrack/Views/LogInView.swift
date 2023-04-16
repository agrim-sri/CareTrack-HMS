//
//  LogInView.swift
//  CareTrack
//
//  Created by Sanskriti Sinha on 16/04/23.
//

import SwiftUI

struct PartialCircle: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            let center = CGPoint(x: 30, y: -120)
            let radius = min(rect.width, rect.height)
            let startAngle = Angle(degrees: 270)
            let endAngle = Angle(degrees: 180)
            
            path.addArc(center: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: false)
        }
    }
}

struct LogInView: View {
    
    @State var email: String = ""
    @State var password: String = ""
    @StateObject var login = LogInViewModel()
    
    
    var body: some View {
        VStack {
            
            
            PartialCircle()
                .foregroundColor(.blue)
                .overlay{
                    VStack{
                        Text("Log In")
                            .font(Font.custom("Archivo", size: 40))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.leading)
                            .padding(.leading)
                            .padding(.top)
                            .foregroundColor(.white)
                        
                        Spacer()
                    }
                    
                    VStack{
                        TextField("Enter your Email", text : $email)
                            .frame(width: 280, height: 40)
                            .font(Font.custom("SF Pro Display", size: 17))
                            
                            .padding(.leading, 30)
                            .background{
                                RoundedRectangle(cornerRadius: 15)
                                    .stroke(lineWidth: 2.0)
                                    
                                    .foregroundColor(Color(red: 0.636, green: 0.716, blue: 0.998))
                                    .frame(width: 280, height: 40)
                                    .background{
                                        RoundedRectangle(cornerRadius: 15)
                                            .fill(Color(red: 0.926, green: 0.946, blue: 1.001))
                                            
                                    }
                            }
                        
                        TextField("Enter your Password", text : $password)
                            .frame(width: 280, height: 40)
                            .font(Font.custom("SF Pro Display", size: 17))
                            .padding(.leading, 30)
                            .padding()
                            .background{
                                RoundedRectangle(cornerRadius: 15)
                                    .stroke(lineWidth: 2.0)
                                    
                                    .foregroundColor(Color(red: 0.636, green: 0.716, blue: 0.998))
                                    .frame(width: 280, height: 40)
                                    .background{
                                        RoundedRectangle(cornerRadius: 15)
                                            .fill(Color(red: 0.926, green: 0.946, blue: 1.001))
                                    }
                            }
                        
                        Button {
                            login.verifyUser(email: email, password: password)
                        } label: {
                            RoundedRectangle(cornerRadius: 15)
                                .frame(width: 150, height: 40)
                                .padding()
                                .overlay {
                                    Text("Log In")
                                        .foregroundColor(.white)
                                        .font(Font.custom("Archivo", size: 17))
                                        .fontWeight(.medium)
                                }
                        }
                    }
                    .padding(.top, 50)
                    
                }
        }
        
        
    }
}

struct LogInView_Previews: PreviewProvider {
    static var previews: some View {
        LogInView()
    }
}
