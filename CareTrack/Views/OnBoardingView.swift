//
//  OnBoardingScreen.swift
//  CareTrack
//
//  Created by Sanskriti Sinha on 15/04/23.
//

import SwiftUI

struct OnBoardingView: View {
    
    @State var mobileno: String = ""
    
    @State var images: [String] = ["Consult",
                                   "MedicalData",
                                   "Verification"]
    
    @State var description: [String] = ["Consult only with a doctor you trust.",
                                   "Get your Medical Data at one place.",
                                   "Easy and simple verification."]
    
    var body: some View {
        
        VStack{
            GeometryReader { proxy in let size = proxy.size
                TabView(){
                    ForEach(0..<3, id : \.self){ i in
                        VStack{
                            Image(images[i])
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                            
                            Text(description[i])
                                .bold()
                                .font(Font.custom("Archivo", size: 17))
                                .padding(.bottom)
                            
                            HStack{
                                Circle()
                                    .frame(width: 10)
                                    .foregroundColor(i == 0 ? .blue : .gray.opacity(0.3))
                                    
                                
                                Circle()
                                    .frame(width: 10)
                                    .foregroundColor(i == 1 ? .blue : .gray.opacity(0.3))
                                
                                Circle()
                                    .frame(width: 10)
                                    .foregroundColor(i == 2 ? .blue : .gray.opacity(0.3))
                            }
                            .padding(.bottom)
                        }
                        
                        
                    }
                            
                }
                .rotationEffect(.init(degrees: 0))
                .frame(width: size.height)
                .tabViewStyle(.page(indexDisplayMode: .never))
                .frame(width: size.width)
            }
            
            
//            TextField("􀌾 Enter Mobile Number", text : $mobileno)
//                .frame(width: 220, height: 48)
//                .font(Font.custom("SF Pro Display", size: 17))
//                .padding(.leading, 30)
//                .background{
//                    RoundedRectangle(cornerRadius: 15)
//                        .stroke(lineWidth: 2.0)
//
//                        .foregroundColor(Color(red: 0.636, green: 0.716, blue: 0.998))
//                        .frame(width: 220, height: 50)
//                        .background{
//                            RoundedRectangle(cornerRadius: 15)
//                                .fill(Color(red: 0.926, green: 0.946, blue: 1.001))
//                        }
//                }
            
            NavigationLink(destination: LogInView()) {
                RoundedRectangle(cornerRadius: 15)
                    .frame(width: 220, height: 50)
                    .overlay {
                        Text("Log In")
                            .font(Font.custom("SF Pro Display", size: 20))
                            .foregroundColor(.white)
                            .bold()
                    }
            }
        
            
            NavigationLink(destination: SignUpView()) {
                Text("Sign Up")
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(lineWidth: 2.0)
                            .frame(width: 220, height: 48)
                    
                    )
            }
           
            .padding(.bottom)
            
            
        }
        .frame(maxHeight: .infinity)
    }
}

struct OnBoardingScreen_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingView()
    }
}
