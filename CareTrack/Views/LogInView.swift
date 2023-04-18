//
//  LogInView.swift
//  CareTrack
//
//  Created by Sanskriti Sinha on 16/04/23.
//

import SwiftUI
import Firebase
struct LogInView: View {
    
    @State var email: String = ""
    @State var password: String = ""
    @StateObject var login = LogInViewModel()
    @State var showAlert: Bool = false
    @State var alertMessage: String = ""
    @AppStorage("signIn") var isSignIn: Bool = false

    
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
                        
                        SecureField("Enter your Password", text : $password)
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
                            verifyUser(email: email, password: password)
                            
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
        }.alert(isPresented: $showAlert) {
            Alert(title: Text("Alert"),message: Text(alertMessage))
        }
        
        
    }
    func verifyUser(email: String, password: String){
        Auth.auth().signIn(withEmail: email, password: password){ result, error in
            
            if(error != nil){
                print(error?.localizedDescription)
                self.alertMessage = error!.localizedDescription
                self.showAlert.toggle()
                return
            }
            
            print("Welcome!")
            isSignIn.toggle()
        }
    }
}

struct LogInView_Previews: PreviewProvider {
    static var previews: some View {
        LogInView()
    }
}

