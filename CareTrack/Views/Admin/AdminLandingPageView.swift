//
//  AdminLandingPage.swift
//  CareTrack
//
//  Created by Tanmay Sharma on 24/04/23.
//
import SwiftUI

struct AdminLandingPageView: View {
    var body: some View {
        
        ScrollView{
            
            LazyVStack{
                
                ProfileAdmin()
                
                makeBeds()
                
                HStack{
                    
                    Text("Book Appointment")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding(.horizontal)
                        .padding(.horizontal)
                    
                    Spacer()
                    
                }
                
                makeAdminAppointments()
                
            }
            
        }.background(Color(#colorLiteral(red: 0.9593991637, green: 0.9593990445, blue: 0.9593991637, alpha: 1)))
    }
}

struct ProfileAdmin : View {
    
    var body : some View{
        
        HStack {
            VStack(alignment: .leading) {
                Text("Welcome,")
                    .font(.largeTitle)
                Text("Admin")
                    .font(.largeTitle)
                    .fontWeight(.bold)
            }
            Spacer()
            Image(systemName: "person.circle")
                .resizable()
                .frame(width: 80, height: 80)
                .foregroundColor(.blue)
                .padding()

        }
        .padding()
        Spacer()
    }
}


struct makeBeds : View{
    
    var body : some View{
        
        RoundedRectangle(cornerRadius: 30)
            .foregroundColor(.white)
            .shadow(radius : 10)
            .frame(height : UIScreen.main.bounds.size.height * 0.20)
            .overlay(
                HStack{
    
                    VStack(alignment: .leading) {
                        Text("77/100")
                            .font(.title)
                        Text("Beds Occupied")
                            .font(.caption)
                            .opacity(0.6)
                    }.padding(.horizontal)
                        .padding(.horizontal)
                    
                    Spacer()
                    
                    ZStack{
                        Circle()
                            .stroke(
                                Color.green.opacity(0.5),
                                lineWidth: 15
                            )
                            
                            .frame(width: 80)
                        Circle()
                            .trim(from: 0, to: 0.77)
                            .stroke(
                                Color.green,
                                lineWidth: 15
                            )
                            .frame(width: 80)
                        
                            .rotationEffect(.degrees(-90))
                            .overlay{
                                Text("77%")
                                    .font(Font.custom("SF Pro Display Bold", size: 20))
                                    .foregroundColor(.green)
                            }
                        
                    }
                    Spacer()
                }
            )
            .padding()
            .padding(.horizontal)
    }
    
}

struct makeAdminAppointments : View {
    
    let bounds = UIScreen.main.bounds
    
    var body : some View{
        
        let height = bounds.size.height
        
        ScrollView{
            
            LazyVStack{
                
                ForEach(0..<10){ index in
                    HStack{
                        
                        Spacer()
                        
                        ForEach(0..<2){ index in
                            Button {
                                // connection for the concerned page
                            } label: {
                                RoundedRectangle(cornerRadius: 30)
                                    .foregroundColor(.white)
                                    .shadow(radius : 10)
                                    .padding()
                                    .frame(height : height * 0.2)
                                    .overlay(
                                        VStack{
                                            Image(systemName: "person.circle")
                                                .resizable()
                                                .frame(width: 80, height: 80)
                                                .foregroundColor(.blue)
                                            
                                            Text("Some Medical Field")
                                        }
                                        
                                    )
                            }
                        }
                        
                        Spacer()
                    }
                }
                
            }
        }
        
    }
    
}

struct AdminPage_Previews: PreviewProvider {
    static var previews: some View {
        AdminLandingPageView()
    }
}
