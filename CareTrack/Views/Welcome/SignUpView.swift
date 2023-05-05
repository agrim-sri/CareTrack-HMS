//
//  SignUpView.swift
//  CareTrack
//
//  Created by Prakhar Parakh on 16/04/23.
//

import SwiftUI
import Firebase


struct SignUpView: View {
    @State var email: String = ""
    @State var password: String = ""
    @State private var age: DateComponents = DateComponents()
    @State private var dateOfBirth = Date()
    @State var name: String = ""
    @State var gender: Int = 0
    @State var phoneNumber: String = ""
    @State private var date = Date()
    let chosenGender = ["Female","Male","Prefer not to disclose"]
    @State var bgColour: Color = Color(red: 242/255, green: 242/255, blue: 242/255)
    @StateObject var signup = SignUpViewModel()
    var body: some View {
        VStack{
            
            SignView()
            
            VStack(spacing:20){
                TextField("Enter Your Email", text : $email)
                    .frame(width: 280, height: 48)
                    .font(Font.custom("SF Pro Display", size: 17))
                    .padding(.leading, 30)
                    .background{
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(lineWidth: 2.0)
                        
                            .foregroundColor(Color(red: 0.636, green: 0.716, blue: 0.998))
                            .frame(width: 300, height: 48)
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
                            .frame(width: 300, height: 48)
                            .background{
                                RoundedRectangle(cornerRadius: 15)
                                    .fill(Color(red: 0.926, green: 0.946, blue: 1.001))
                            }
                    }
                
                TextField("Enter Your Name", text : $name)
                    .frame(width: 280, height: 48)
                    .font(Font.custom("SF Pro Display", size: 17))
                    .padding(.leading, 30)
                    .background{
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(lineWidth: 2.0)
                        
                            .foregroundColor(Color(red: 0.636, green: 0.716, blue: 0.998))
                            .frame(width: 300, height: 48)
                            .background{
                                RoundedRectangle(cornerRadius: 15)
                                    .fill(Color(red: 0.926, green: 0.946, blue: 1.001))
                            }
                    }
                
                
                ZStack{
                    DatePicker("Select date of Birth", selection: $dateOfBirth , displayedComponents: .date)
                        .frame(width: 280, height: 48)
                        .font(Font.custom("SF Pro Display", size: 17))
                        .foregroundColor(Color(red: 0.773, green: 0.773, blue: 0.781))
                        .padding([.leading,.trailing],35)
                        .background{
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(lineWidth: 2.0)
                                .foregroundColor(Color(red: 0.636, green: 0.716, blue: 0.998))
                                .frame(width: 300, height: 48)
                                .background{
                                    RoundedRectangle(cornerRadius: 15)
                                        .fill(Color(red: 0.926, green: 0.946, blue: 1.001))
                                }
                        }.onChange(of: dateOfBirth, perform: { value in
                            age = Calendar.current.dateComponents([.year, .month, .day], from: dateOfBirth, to: Date())
                            print(age.year)
                        })
                    
                }
                
                HStack {
                    Text("Select a gender:")
                        .foregroundColor(Color(red: 0.773, green: 0.773, blue: 0.781))
                        .font(.headline)
                        .lineLimit(1)
                        .padding()
                        .padding(.leading,60)
                    Spacer()
                    Picker(selection: $gender, label: Text("Select a gender")) {
                        ForEach(0 ..< chosenGender.count) {
                            Text(self.chosenGender[$0])
                        }
                    }
                    .background(bgColour.cornerRadius(10))
                    .padding(.trailing)
                    .padding(.trailing,60)
                }.background{
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(lineWidth: 2.0)
                    
                        .foregroundColor(Color(red: 0.636, green: 0.716, blue: 0.998))
                        .frame(width: 300, height: 48)
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
                            .frame(width: 300, height: 48)
                            .background{
                                RoundedRectangle(cornerRadius: 15)
                                    .fill(Color(red: 0.926, green: 0.946, blue: 1.001))
                            }
                    }
                Button{
                    if email != "" && password != ""{
                        Auth.auth().createUser(withEmail: email, password: password){result,error in
                            if error == nil{
                                let id = result!.user.uid
                                signup.registerUser(id: id,name: name, age: Int(age.year!), phone: (phoneNumber), gender: chosenGender[gender])
                            }
                        }
                        
                        
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
            }

            
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
