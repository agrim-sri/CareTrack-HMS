//
//  HeartRateChartView.swift
//  CareTrack
//
//  Created by Sanskriti Sinha on 25/04/23.
//

import SwiftUI
import Charts

struct heartRate : Identifiable{
    let id = UUID()
    let time: String
    let heartrates: Int
    let dailyMin: Int
    let dailyMax: Int
}

struct HeartRateChartView: View {
    
    let temp: [heartRate] = [heartRate(time: "12 AM", heartrates: 86, dailyMin: 70, dailyMax: 90),
                             heartRate(time: "1 AM", heartrates: 85, dailyMin: 40, dailyMax: 95),
                             heartRate(time: "2 AM", heartrates: 89, dailyMin: 60, dailyMax: 90),
                             heartRate(time: "3 AM", heartrates: 115, dailyMin: 80, dailyMax: 120),
                             heartRate(time: "4 AM", heartrates: 70, dailyMin: 60, dailyMax: 80),
                             heartRate(time: "5 AM", heartrates: 63, dailyMin: 30, dailyMax: 70),
                             heartRate(time: "6 AM", heartrates: 81, dailyMin: 60, dailyMax: 90)]
    
    var body: some View {
        
        Chart(temp){
            
             BarMark(
                
                x: .value("Time", $0.time),
                yStart: .value("Daily Min", $0.dailyMin),
                yEnd: .value("Daily Min", $0.dailyMax),
                width: .ratio(0.2)
                
             )
        }
        
        
    }
}

struct HeartRateChartView_Previews: PreviewProvider {
    static var previews: some View {
        HeartRateChartView()
    }
}

