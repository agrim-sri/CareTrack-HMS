//
//  PatientVitalsView.swift
//  CareTrack
//
//  Created by Sanskriti Sinha on 24/04/23.
//

import SwiftUI

struct PatientVitalsView: View {
    
    var column: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    @ObservedObject var HealthKitVM = HealthKitViewModel()
    
    var smallBox: [[String : String]] =
    [
        ["Image": "HeightWeight", "HeightLabel": "Height","Height": "185", "centi": "cm", "WeightLabel": "Weight","Weight": "65", "kilos":"kg"],
        ["SleepImages": "SleepImage", "SleepLabel": "Sleep", "hours": "8.5", "hr":"hrs", "StepImages": "StepImage", "StepLabel": "Steps","num": "92", "step":"steps"]
    ]
    
    
    var body: some View {

        NavigationView {
            ZStack {
                Color(red: 0.949, green: 0.949, blue: 0.949)
                    .ignoresSafeArea()
                ScrollView {
                    VStack{
                        
                        LazyVGrid(columns: column) {
                            ForEach(0..<2){ i in
                                RoundedRectangle(cornerRadius: 30)
                                    .frame(width: UIScreen.screenWidth * 0.45,height: 200)
                                    .foregroundColor(.white)
                                    .shadow(radius: 6.0)
                                    .overlay{
                                        VStack(alignment: .leading) {
                                            if(i==0){
                                                VitalCardsView(image1: smallBox[i]["Image"]!,
                                                               image2: smallBox[i]["Image"]!,
                                                               heightLabel: smallBox[i]["HeightLabel"]!,
                                                               height: HealthKitVM.height,
                                                               unit1: smallBox[i]["centi"]!,
                                                               weightLabel: smallBox[i]["WeightLabel"]!,
                                                               weight: HealthKitVM.weight,
                                                               unit2: smallBox[i]["kilos"]!
                                                )
                                            }
                                            
                                            
                                            if(i>0){
                                                VitalCardsView(image1: smallBox[i]["SleepImages"]!,
                                                               image2: smallBox[i]["StepImages"]!,
                                                               heightLabel: smallBox[i]["SleepLabel"]!,
                                                               height: String(HealthKitVM.sleepAmount),
                                                               unit1: smallBox[i]["hr"]!,
                                                               weightLabel: smallBox[i]["StepLabel"]!,
                                                               weight: String(HealthKitVM.userStepCount),
                                                               unit2: smallBox[i]["step"]!
                                                )
                                            }
                                            
                                        }.padding(.top)
                                            .padding(.bottom)
                                            .padding(.trailing)
                                            .padding(.trailing)
                                        
                                        
                                    }
                            }
                        }
                        .padding(.top)
                        .padding(.leading,30)
                        .padding(.trailing,30)
                        
                        
                        RoundedRectangle(cornerRadius: 30)
                            .frame(width: UIScreen.screenWidth - 32, height: 200)
                            .foregroundColor(.white)
                            .shadow(radius: 6.0)
                            .padding()
                            .padding(.leading)
                            .padding(.trailing)
                            .overlay{
                                HStack {
                                    VStack(alignment: .leading)  {
                                        HStack{
                                            Image("HeartRate")
                                            Text("Heart Rate")
                                                .foregroundColor(.blue)
                                        }.padding(.leading)
                                        
                                        HStack {
                                            VStack {
                                                HStack{
                                                    Text("\(HealthKitVM.heart)")
                                                        .font(.system(size: 35))
                                                        .bold()
                                                    Text("BPM")
                                                        .foregroundColor(.secondary)
                                                }
                                                
                                                Image("HeartImage")
                                                    .resizable()
                                                    .aspectRatio(contentMode: .fit)
                                                    .frame(width: 70, height: 70)
                                            }
                                            
                                            
                                            
                                        }
                                    }.padding()
                                    
                                    HeartRateChartView()
                                             .frame(width: 180, height: 120)
                                             .padding(.trailing)
                                    
                                    
                                }
                                
                                
                            }
                        
                        RoundedRectangle(cornerRadius: 30)
                            .frame(width: UIScreen.screenWidth - 32, height: 200)
                            .foregroundColor(.white)
                            .shadow(radius: 6.0)
                            .padding(.leading)
                            .padding(.trailing)
                            .overlay{
                                VStack(alignment: .leading)  {
                                    HStack {
                                        VStack {
                                            HStack{
                                                Image("BloodOxygen")
                                                Text("Respiration")
                                                    .foregroundColor(Color.green)
                                                
                                                
                                            }
                                            HStack{
                                                Text("\(HealthKitVM.respiration)")
                                                    .font(.system(size: 35))
                                                    .bold()
                                                Text("%")
                                                    .foregroundColor(.secondary)
                                                    .font(.system(size: 20))
                                            }
                                            
                                            Spacer()
                                        }.padding(.top)
                                        
                                           BloodOxygenChartView()
                                                .frame(width: 180, height: 120)
                                                .padding(.leading)
                                    }
                                    
                                    
                                }
                            }
                        
                    }
                    
                }.navigationTitle(Text("Body Vitals"))
            }
                .task{
                    HealthKitVM.healthRequest()
            }
        }
    }
    
    
}
    
    struct PatientVitalsView_Previews: PreviewProvider {
        static var previews: some View {
            PatientVitalsView()
        }
    }
