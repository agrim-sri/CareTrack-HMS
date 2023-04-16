//
//  SignUpView.swift
//  CareTrack
//
//  Created by Prakhar Parakh on 16/04/23.
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


struct SignUpView: View {
    @State var email: String = ""
    @State var password: String = ""
    @State var age: String = ""
    @State var gender: String = ""
    @State var phoneNumber: String = ""
    @StateObject var signup = SignUpViewModel()
    var body: some View {
        VStack{
            
            PartialCircle()
                .fill(.blue)
                .overlay{
                    VStack{
                        Text("Sign Up")
                            .frame(maxWidth: .infinity,alignment: .leading)
                            .padding(.leading)
                            .font(Font.custom("Archivo", size: 48))
                            .foregroundColor(.white)
                            .padding(.top)
                        Spacer()

                    }
                    VStack(spacing:20){
                        Spacer()
                        Spacer()
                        Spacer()
                        TextField("Enter Your Email", text : $email)
                            .frame(width: 280, height: 48)
                            .font(Font.custom("SF Pro Display", size: 17))
                            .padding(.leading, 30)
                            .background{
                                RoundedRectangle(cornerRadius: 15)
                                    .stroke(lineWidth: 2.0)
                                    
                                    .foregroundColor(Color(red: 0.636, green: 0.716, blue: 0.998))
                                    .frame(width: 280, height: 48)
                                    .background{
                                        RoundedRectangle(cornerRadius: 15)
                                            .fill(Color(red: 0.926, green: 0.946, blue: 1.001))
                                    }
                            }
                        SecureField("Enter Your Password", text : $password)
                            .frame(width: 280, height: 48)
                            .font(Font.custom("SF Pro Display", size: 17))
                            .padding(.leading, 30)
                            .background{
                                RoundedRectangle(cornerRadius: 15)
                                    .stroke(lineWidth: 2.0)
                                    
                                    .foregroundColor(Color(red: 0.636, green: 0.716, blue: 0.998))
                                    .frame(width: 280, height: 48)
                                    .background{
                                        RoundedRectangle(cornerRadius: 15)
                                            .fill(Color(red: 0.926, green: 0.946, blue: 1.001))
                                    }
                            }
                        TextField("Enter Your Age", text : $age)
                            .frame(width: 280, height: 48)
                            .font(Font.custom("SF Pro Display", size: 17))
                            .padding(.leading, 30)
                            .background{
                                RoundedRectangle(cornerRadius: 15)
                                    .stroke(lineWidth: 2.0)
                                    
                                    .foregroundColor(Color(red: 0.636, green: 0.716, blue: 0.998))
                                    .frame(width: 280, height: 48)
                                    .background{
                                        RoundedRectangle(cornerRadius: 15)
                                            .fill(Color(red: 0.926, green: 0.946, blue: 1.001))
                                    }
                            }
                        TextField("Gender", text : $gender)
                            .frame(width: 280, height: 48)
                            .font(Font.custom("SF Pro Display", size: 17))
                            .padding(.leading, 30)
                            .background{
                                RoundedRectangle(cornerRadius: 15)
                                    .stroke(lineWidth: 2.0)
                                    
                                    .foregroundColor(Color(red: 0.636, green: 0.716, blue: 0.998))
                                    .frame(width: 280, height: 48)
                                    .background{
                                        RoundedRectangle(cornerRadius: 15)
                                            .fill(Color(red: 0.926, green: 0.946, blue: 1.001))
                                    }
                            }
                        TextField("Phone Number", text : $phoneNumber)
                            .frame(width: 280, height: 48)
                            .font(Font.custom("SF Pro Display", size: 17))
                            .padding(.leading, 30)
                            .background{
                                RoundedRectangle(cornerRadius: 15)
                                    .stroke(lineWidth: 2.0)
                                    
                                    .foregroundColor(Color(red: 0.636, green: 0.716, blue: 0.998))
                                    .frame(width: 280, height: 48)
                                    .background{
                                        RoundedRectangle(cornerRadius: 15)
                                            .fill(Color(red: 0.926, green: 0.946, blue: 1.001))
                                    }
                            }
                        Button{
                            if email != "" && password != ""{
                                signup.registerUser(email: email, password: password)
                            }
                            
                        }label: {
                            Text("Sign Up")
                                .font(Font.custom("SF Pro Display", size: 17))
                                .foregroundColor(.white)
                                .background {
                                    RoundedRectangle(cornerRadius: 15)
                                        .frame(width: 280,height: 48)
                                    
                                }

                        }
                        .padding(.top)
                        
                        Spacer()
                    }
                    
                    

                }

            
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
