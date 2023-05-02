//
//  PatientProfileView.swift
//  CareTrack
//
//  Created by Zeal Shah on 26/04/23.
//

import SwiftUI
import Firebase

struct DoctorProfileView: View {
    @AppStorage("usersignIn") var userIsSignIn: Bool = false
    @State var bgColour: Color = Color(red: 242/255, green: 242/255, blue: 242/255)
    @State var listLabels = ["Label","Security","Notifications","Permissions","Help and Support"]
    @State var listIcons = ["volume.2.fill","lock","bell.badge","key","headphones"]
    @State var isNotificationOn: Bool = true
    @AppStorage("doctorsignIn") var doctorIsSignIn: Bool = false

    
    var body: some View {
        ZStack {
            bgColour.ignoresSafeArea()
            ScrollView {
                VStack {
                    Text("My Account")
                        .font(Font.custom("SF Pro Display Bold", size: 28))
                        .frame(maxWidth: .infinity,alignment: .leading)
                        .padding(.leading)
                    HStack {
                        Spacer()
                        VStack{
                            Spacer()
                            Text("Prakhar Parakh")
                                .font(Font.custom("SF Pro Display Semibold", size: 20))
                                .frame(maxWidth: .infinity,alignment: .leading)
                            Spacer()
                            Text("Male")
                                .font(Font.custom("SF Pro Display Light", size: 16))
                                .frame(maxWidth: .infinity,alignment: .leading)
                                .opacity(0.6)
                            Spacer()
                            Text("21 yrs old")
                                .font(Font.custom("SF Pro Display Light", size: 14))
                                .frame(maxWidth: .infinity,alignment: .leading)
                                .opacity(0.6)
                            Spacer()
                        }
                        .padding()
                        Image("Profile Image")
                            .resizable()
                            .frame(width: 100, height: 100)
                            .padding(.trailing)
                            
                        Spacer()
                        
                    }
                    .background(
                        RoundedRectangle(cornerRadius: 20)
                            .fill(.white))
                    .padding()
                    Text("Settings")
                        .font(Font.custom("SF Pro Display Semibold", size: 20))
                        .frame(maxWidth: .infinity,alignment: .leading)
                        .padding(.leading)
                        .padding(.top,30)
                        
                        
                    VStack {
                        ForEach(0..<5){i in
                                VStack {
                                    HStack{
                                        Image(systemName: listIcons[i])
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 20,height: 20)
                                            .foregroundColor(.white)
                                            .padding(6)
                                            .background(
                                                RoundedRectangle(cornerRadius: 10)
                                                    .fill(.blue))
                                            .padding(.leading)
                                        HStack{
                                            if i == 2 {
                                                Toggle(isOn: $isNotificationOn) {
                                                    Text("Notification")
                                                        .font(Font.custom("SF Pro Display Light", size: 20))
                                                        .padding()
                                                }
                                                .padding(.trailing)
                                            }
                                            else{
                                                Text(listLabels[i])
                                                    .font(Font.custom("SF Pro Display Light", size: 20))
                                                    .padding()
                                                Spacer()
                                                Image(systemName: "chevron.right")
                                                
                                                
                                                    .foregroundColor(.black)
                                                    .opacity(0.6)
                                                    .padding(.trailing)
                                            }
                                            
                                            
                                        }
                                        
                                        
                                        
                                    }
                                    
                                    if(i != 4){
                                        Divider()
                                            .frame(height: 0.5)
                                            .overlay(.secondary)
                                    }
                                    
                                        
                                            
                                    
                                }
                                                                


                        }
                    }
                    .padding(30)
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .fill(.white)
                            .padding()
                        
                    )

                            Button() {
                                signOut()
                            }
                        label: {
                            
                            HStack {
                                Image(systemName: "power")
                                    .foregroundColor(.white)
                                Text("Log Out")
                                        .foregroundColor(.white)
                                        
                            }
                            .frame(width: 120,height: 50)
                            .background(
                            RoundedRectangle(cornerRadius: 8)
                                .fill(.red))
                            
                            
                                
                                
                            }.padding(.top,40)
                                .buttonStyle(.plain)
                        
                        
                    
                    
                }
                
            }
        }
    }
    
    func signOut(){
        do{
            try Auth.auth().signOut()
            doctorIsSignIn.toggle()
        }
        catch{
            print("Err")
        }
    }
}

struct DoctorProfileView_Previews: PreviewProvider {
    static var previews: some View {
        DoctorProfileView()
    }
}

