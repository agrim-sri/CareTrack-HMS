//
//  MedicineTrackingView.swift
//  CareTrack
//
//  Created by Prakhar Parakh on 04/05/23.
//

import SwiftUI
import Firebase

struct MedicineTrackingView: View {
    
    @StateObject var prescriptionVM = PrescriptionViewModel()
    
//     #F2F2F2
    @State var bgColor:Color = Color(red: 242/255, green: 242/255, blue: 242/255)
    // #1C1C1C
    @State var headingColor:Color = Color(red: 28/255, green: 28/255, blue: 28/255)
//    #A1A8B0
    @State var dayColor:Color = Color(red: 161/255, green: 168/255, blue: 176/255)
//     #101623
    @State var dateColor:Color = Color(red: 16/255, green: 22/255, blue: 35/255)
//      #9FD356
    @State var greenColor:Color = Color(red: 159/255, green: 211/255, blue: 86/255)
//      #EBFFCF
    @State var secondaryGreen:Color = Color(red: 235/255, green: 255/255, blue: 207/255)
//    #9E9E9E
    @State var greyColor:Color = Color(red: 158/255, green: 158/255, blue: 158/255)
    
    var body: some View {
        
        VStack {
            ForEach(prescriptionVM.medicine){i in
                ForEach(0..<i.Medication.count) { j in
                    VStack(alignment: .leading){
                        VStack(alignment: .leading){
                            Text(i.Medication[j].MedicineName)
                                .font(Font.custom("SF Pro Display Semibold", size: 20))
                                .padding(.leading)
                        }

                        HStack{
                            Text("Your Medication is in Progress!")
                                .font(Font.custom("SF Pro Display Semibold", size: 22))
                                .foregroundColor(greenColor)
                                .padding(.trailing)
                            Spacer()
                            ZStack{
                                Circle()
                                    .stroke(
                                        secondaryGreen,
                                        lineWidth: 15
                                    )

                                    .frame(width: 90)
                                Circle()
                                    .trim(from: 0, to: prescriptionVM.percentComplect1[j])
                                    .stroke(
                                        greenColor,
                                        lineWidth: 15
                                    )
                                    .frame(width: 90)

                                    .rotationEffect(.degrees(-90))
                                    .overlay{
                                        Text("\(prescriptionVM.percentComplect[j]) %")
                                            .font(Font.custom("SF Pro Display Bold", size: 24))
                                        
                                            .foregroundColor(greenColor)
                                        
                                    }
                            }
                        }
                        .padding([.leading,.trailing,.bottom])
                            .padding(.trailing)

                        HStack(){
                            Text("\(prescriptionVM.totalDay[j]) per day")
                                .font(Font.custom("SF Pro Display Medium", size: 16))
                                .foregroundColor(headingColor)
                                .padding(.leading)
                            Spacer()
                            Text("Till \(Calendar.current.date(byAdding: .day, value: i.Medication[j].Duration, to: Foundation.Date(milliseconds: Int64(i.Date)))!.formatted(date: .abbreviated, time: .omitted))")
                                .font(Font.custom("SF Pro Display", size: 12))
                                .foregroundColor(greyColor)
                                .padding(.trailing)
                                .padding(.trailing)
                        }.padding(.bottom)
                            .padding(.top)
                    }.padding(.top)
                        .padding([.leading,.trailing])
                        .background{
                            RoundedRectangle(cornerRadius: 20)
                                .frame(width: UIScreen.screenWidth - 32)
                                .foregroundColor(.white)
                                .shadow(radius: 5)
                        }

                }
            }.padding(.top)
                
        }.onFirstAppear {
            prescriptionVM.getMedicines(id: Auth.auth().currentUser!.uid)
    }
    }
}

struct MedicineTrackingView_Previews: PreviewProvider {
    static var previews: some View {
        MedicineTrackingView()
    }
}

