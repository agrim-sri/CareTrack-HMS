//
//  AdminLandingPageFinal.swift
//  CareTrack
//
//  Created by Zeal Shah  on 04/05/23.
//

import SwiftUI
import FirebaseAuth

struct checkUserStatus :View{
    @State var email: String = ""
    @State var showNextButton: Bool = false
    var body: some View{
        NavigationView {
            ZStack{
                VStack{
                  Text("Check user Status")
                        .padding(.top)
                    TextField("Enter Your Email", text : $email)
                        .frame(width: 280, height: 48,alignment: .leading)
                        .font(Font.custom("SF Pro Display", size: 17))
                        
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
                        Auth.auth().fetchSignInMethods(forEmail: email){result,error in
                            if error == nil{
                                if result != nil{
                                    print(result)
                                    return

                                }
                                self.showNextButton.toggle()

                            }
                        }
                    }label: {
                        Text("Check User")
                            .font(Font.custom("SF Pro Display", size: 16))
                            .foregroundColor(.white)
                            .background {
                                RoundedRectangle(cornerRadius: 15)
                                    .frame(width: 280,height: 48)
                                
                            }

                    }
                    .padding([.top,.bottom],70)
                    
                    if showNextButton{
                        NavigationLink(destination: AddPatientView()) {
                            Text("Sign User")
                                .font(Font.custom("SF Pro Display", size: 16))
                                .foregroundColor(.white)
                                .background {
                                    RoundedRectangle(cornerRadius: 15)
                                        .frame(width: 280,height: 48)
                                    
                                }
                        }
                    }
                    
                }
            }
        }
    }
}

struct AdminLandingPageFinal: View {
    @State var bgColour: Color = Color(red: 242/255, green: 242/255, blue: 242/255)
    @State var fontColor: Color = Color(red: 28/255, green: 28/255, blue: 28/255)
    @State var greenColor: Color = Color(red: 159/255, green: 211/255, blue: 86/255)
    @State var dayColor: Color = Color(red: 158/255, green: 158/255, blue: 158/255)
    
    @State var showCheckUser:Bool = false
    
    let dict: [String] = ["Surgery",
                          "Neurology",
                          "General",
                          "Sonography",
                          "Vaccination"
                          ,"Physiotherapy",
                                                         "Senior HealthCare",
                                                         "Radiology"
    ]
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),

    ]
    var body: some View {
        ZStack{
            bgColour.ignoresSafeArea()
            ScrollView{
                VStack{
                    HStack{
                    VStack(alignment:.leading,spacing:15){
                        Text("Hello 👋")
                            .font(Font.custom("SF Pro Display Regular", size: 24))
                            .padding(.top)
                            .foregroundColor(fontColor)
                            
                        Text("Admin")
                            .font(Font.custom("SF Pro Display Semibold", size: 32))
                            .foregroundColor(fontColor)
                            
                        
                    }.padding(.leading)
                    Spacer()
                    Image("AdminAvatar")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 120,height: 120)
                        .padding(.trailing)
                }.padding(.bottom)
                    HStack{
                        Image("patient")
                        VStack{
                            Text("Patients")
                                .font(Font.custom("SF Pro Display Medium", size: 16))
                            Text("456")
                                .font(Font.custom("SF Pro Display Medium", size: 20))
                                .foregroundColor(Color(red: 0/255, green: 125/255, blue: 254/255))
                        }
                        .padding(.trailing,30)
                        Spacer()
                        Image("first aid")
                        VStack{
                            Text("Doctors")
                                .font(Font.custom("SF Pro Display Medium", size: 16))
                            Text("70")
                                .font(Font.custom("SF Pro Display Medium", size: 20))
                                .foregroundColor(Color(red: 0/255, green: 125/255, blue: 254/255))
                        }
                              }
                    .padding([.leading,.trailing],35)
                    .padding()
                    .background{
                        RoundedRectangle(cornerRadius: 15)
                            .frame(width: UIScreen.screenWidth - 32,height: 100)
                            .foregroundColor(.white)
                            .shadow(radius: 3)
                    }
                    .padding()
                    Text("Departments")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading)
                        .font(Font.custom("SF Pro Display Semibold", size: 16))
                        .padding(.top)
                    LazyVGrid(columns: columns) {
                        ForEach(0..<dict.count){i in
                            Button {
                                showCheckUser.toggle()
                                
                            } label: {
                                VStack{
                                    Image(dict[i])
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .padding()

                                    Text(dict[i])
                                        .font(Font.custom("SF Pro Display Semibold", size: 16))
                                        .foregroundColor(.black)
                                        .padding(.bottom)
                                        
                                }
                                .sheet(isPresented: $showCheckUser, content: {
                                    checkUserStatus()
                                        .presentationDetents([.large])
                                })
                                .background {
                                    RoundedRectangle(cornerRadius: 15)
                                        .foregroundColor(.white)
                                        .shadow(radius: 3)
                                }
                                .padding(.leading)
                                .padding(.trailing)
                                .padding(.bottom)
                            }

                                
                            }
                            
                            
                        
                        
                    }
                    Spacer()
                }
            }
        }
    }
}


struct AdminLandingPageFinal_Previews: PreviewProvider {
    static var previews: some View {
        AdminLandingPageFinal()
    }
}
