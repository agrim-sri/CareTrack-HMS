//
//  PatientDashboardView.swift
//  CareTrack
//
//  Created by Prakhar Parakh on 17/04/23.
//

import SwiftUI
import FirebaseAuth

public extension View {
    func onFirstAppear(_ action: @escaping () -> ()) -> some View {
        modifier(FirstAppear(action: action))
    }
}

private struct FirstAppear: ViewModifier {
    let action: () -> ()
    
    // Use this to only fire your block one time
    @State private var hasAppeared = false
    
    func body(content: Content) -> some View {
        // And then, track it here
        content.onAppear {
            guard !hasAppeared else { return }
            hasAppeared = true
            action()
        }
    }
}

struct PatientDashboardView: View {
    @State var medicine: [String] = ["Dolo 650","Crocin"]
    @State var dosage: [Int] = [1,2]
    @StateObject var patientVM = PatientDashboardViewModel()
    @StateObject var prescriptionVM = PrescriptionViewModel()
    
    
//     #F2F2F2
    @State var bgColor:Color = Color(red: 242/255, green: 242/255, blue: 242/255)
    // #1C1C1C
    @State var headingColor:Color = Color(red: 28/255, green: 28/255, blue: 28/255)
//    #A1A8B0
    @State var dayColor:Color = Color(red: 161/255, green: 168/255, blue: 176/255)
//     #101623
    @State var dateColor:Color = Color(red: 16/255, green: 22/255, blue: 35/255)
    var body: some View {
        
        ZStack {
            bgColor
                .ignoresSafeArea()
            ScrollView(showsIndicators: false){
                VStack{
                    HStack{
                        VStack(alignment:.leading,spacing:15){
                            Text("Hello 👋🏻")
                                .font(Font.custom("SF Pro Display Regular", size: 20))
                                .foregroundColor(headingColor)
                                .padding(.top)
                                
                            if patientVM.user.count > 0{
                                Text("\(patientVM.user[0].name)")
                                    .font(Font.custom("SF Pro Display Semibold", size: 32))
                                    .foregroundColor(headingColor)
                            }
                            
                        }.padding(.leading)
                        Spacer()
                        Image("PatientAvatar")
                            .resizable()
                            .frame(width: 90, height: 90)
                            .padding(.trailing)
                            
                    }.padding(.bottom)
                    
                    VStack{
                        Text("Upcoming Appointments")
                            .font(Font.custom("SF Pro Display Semibold", size: 24))
                            .frame(maxWidth: .infinity,alignment: .leading)
                            .padding(.leading)
                        ScrollView(.horizontal,showsIndicators: false){
                            
                            HStack {
                                ForEach(0..<patientVM.appointments.count, id: \.self){i in
                                    HStack{
                                        if Foundation.Date(milliseconds: Int64(patientVM.appointments[i].date)) >= Date.now{
                                            HStack{
                                                VStack(spacing: 5){
                                                    Text("\(Foundation.Date(milliseconds: Int64(patientVM.appointments[i].date)).formatted(date: .abbreviated, time: .omitted))")
                                                        .frame(width: UIScreen.screenWidth * 0.2)
                                                        .font(Font.custom("SF Pro Display Heavy", size: 20))
                                                        .foregroundColor(.white)
                                                    
                                                }.padding()
                                                    .background {
                                                        RoundedRectangle(cornerRadius: 20)
                                                            .foregroundColor(Color(red: 0.139, green: 0.561, blue: 0.996))
                                                    }
                                                    .padding()
                                                    
                                                VStack(alignment: .leading, spacing:5){
                                                    Text("\(patientVM.appointments[i].time):00")
                                                        .font(Font.custom("SF Pro Display Regular", size: 16))
                                                        .foregroundColor(.white)
                                                        
                                                    
                                                    Text("\(patientVM.appointments[i].doctorName)")
                                                        
                                                        .font(Font.custom("SF Pro Display Bold", size: 16))
                                                        .fontWeight(.bold)
                                                        .foregroundColor(.white)
                                                    Text("\(patientVM.appointments[i].department)")
                                                        .font(Font.custom("SF Pro Display Regular", size: 16))
                                                        .foregroundColor(.white)
                                                }
                                                .padding()
                                            }.background{
                                                RoundedRectangle(cornerRadius: 28)
                                                    .foregroundColor(Color(red: 0.008, green: 0.49, blue: 0.998))
                                            }.padding(.leading)
                                        }
                                       
                                        
                                    }
                                }
                            }
                            
                            
                        }
                        
                    }
                    .padding(.top)
                    
                    VStack{
                        Text("Medicine Tracking")
                            .font(Font.custom("SF Pro Display Semibold", size: 24))
                            .frame(maxWidth: .infinity,alignment: .leading)
                            .foregroundColor(headingColor)
                            .padding(.leading)
                        
                        MedicineTrackingView()

                    }.padding(.top)
                }
            }
        }.task {
            patientVM.getUser()
            prescriptionVM.getMedicines(id: Auth.auth().currentUser!.uid)
        }
    }
}

struct PatientDashboardView_Previews: PreviewProvider {
    static var previews: some View {
        PatientDashboardView()
    }
}

