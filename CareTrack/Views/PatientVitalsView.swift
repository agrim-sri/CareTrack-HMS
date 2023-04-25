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
    
    var smallBox: [[String : String]] =
    [
        ["Image": "HeightWeight", "HeightLabel": "Height","Height": "185", "centi": "cm", "WeightLabel": "Weight","Weight": "65", "kilos":"kg"],
        ["SleepImages": "SleepImage", "SleepLabel": "Sleep", "hours": "8.5", "hr":"hrs", "StepImages": "StepImage", "StepLabel": "Steps","num":"92", "step":"steps"]
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
                                    .foregroundColor(.white)                                    .shadow(radius: 6.0)
                                    .overlay{
                                        VStack(alignment: .leading) {
                                            if(i==0){
                                                HStack(spacing: -10){
                                                    Image(smallBox[i]["Image"]!)
                                                        .resizable()
                                                        .aspectRatio(contentMode: .fit)
                                                        .frame(width: 30, height: 30)
                                                        .padding(.trailing)
                                                    Text(smallBox[i]["HeightLabel"]!)
                                                        .padding(.trailing)
                                                        .foregroundColor(.blue)
                                                }
                                                
                                                HStack {
                                                    Text(smallBox[i]["Height"]!)
                                                        .font(.system(size: 30))
                                                        .bold()
                                                        .padding(.leading)
                                                    
                                                    Text(smallBox[i]["centi"]!)
                                                        .foregroundColor(.secondary)
                                                    
                                                    
                                                }
                                                
                                                HStack(spacing: -10){
                                                    Image(smallBox[i]["Image"]!)
                                                    
                                                        .resizable()
                                                        .aspectRatio(contentMode: .fit)
                                                        .frame(width: 30, height: 30)
                                                        .padding(.trailing)
                                                    Text(smallBox[i]["WeightLabel"]!)
                                                        .padding(.trailing)
                                                        .foregroundColor(.blue)
                                                }
                                                
                                                HStack {
                                                    Text(smallBox[i]["Weight"]!)
                                                        .font(.system(size: 30))
                                                        .bold()
                                                        .padding(.leading)
                                                    
                                                    Text(smallBox[i]["kilos"]!)
                                                        .foregroundColor(.secondary)
                                                }
                                            }
                                            
                                                
                                            if(i>0){
                                                HStack(spacing: -10){
                                                    Image(smallBox[i]["SleepImages"]!)
                                                        .resizable()
                                                        .aspectRatio(contentMode: .fit)
                                                        .frame(width: 30, height: 30)
                                                        .padding(.trailing)
                                                    
                                                    Text(smallBox[i]["SleepLabel"]!)
                                                        .padding(.trailing)
                                                        .foregroundColor(.blue)
                                                }
                                                
                                                HStack {
                                                    Text(smallBox[i]["hours"]!)
                                                        .font(.system(size: 30))
                                                        .bold()
                                                        .padding(.leading)
                                                    
                                                    Text(smallBox[i]["hr"]!)
                                                        .foregroundColor(.secondary)
                                                    
                                                }
                                                
                                                HStack(spacing: -10){
                                                    Image(smallBox[i]["StepImages"]!)
                                                        .resizable()
                                                        .aspectRatio(contentMode: .fit)
                                                        .frame(width: 30, height: 30)
                                                        .padding(.trailing)
                                                    
                                                    Text(smallBox[i]["StepLabel"]!)
                                                        .padding(.trailing)
                                                        .foregroundColor(.blue)
                                                }
                                                
                                                HStack {
                                                    Text(smallBox[i]["num"]!)
                                                        .font(.system(size: 30))
                                                        .bold()
                                                        .padding(.leading)
                                                    
                                                    Text(smallBox[i]["step"]!)
                                                        .foregroundColor(.secondary)
                                                    
                                                }
                                            }
                                                
                                            }.padding(.top)
                                                .padding(.bottom)
                                                .padding(.trailing)
                                                .padding(.trailing)
                                            
                                            
                                        }
                                    }
                            }
                            .padding(.top)
                            .padding(.leading)
                            .padding(.trailing)
                            
                            
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
                                            }.padding(.trailing)
                                            
                                            HStack {
                                                VStack {
                                                    HStack{
                                                        Text("99")
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
                                             .padding(.leading)
                                                
                                        
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
                                                    Text("Blood Oxygen")
                                                        .foregroundColor(.blue)
                                                    
                                                
                                                }
                                                HStack{
                                                    Text("99")
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
                        
                    }
                }.navigationTitle("Body Vitals")
            }
        }
    }
    
    struct PatientVitalsView_Previews: PreviewProvider {
        static var previews: some View {
            PatientVitalsView()
        }
    }

