//
//  BloodOxygenChartView.swift
//  CareTrack
//
//  Created by Sanskriti Sinha on 24/04/23.
//

import SwiftUI
import Charts

struct BloodOxygen : Identifiable{
    let id = UUID()
    let day : String
    let bloodOxygen : Int
}



struct BloodOxygenChartView: View {
    
    let temp: [BloodOxygen] = [BloodOxygen(day: "M", bloodOxygen: 72),
                             BloodOxygen(day: "T", bloodOxygen: 85),
                             BloodOxygen(day: "W", bloodOxygen: 89),
                             BloodOxygen(day: "Th", bloodOxygen: 115),
                             BloodOxygen(day: "F", bloodOxygen: 70),
                             BloodOxygen(day: "Sat", bloodOxygen: 63),
                             BloodOxygen(day: "S", bloodOxygen: 81)]
    var body: some View {
        
            Chart(temp){
                
            
                    BarMark(
                        x: .value("Day", $0.day),
                        y: .value("Value", $0.bloodOxygen),
                        
                        width: .ratio(0.2)
                        
                    )
            }
        
        
    }
}

struct BloodOxygenChartView_Previews: PreviewProvider {
    static var previews: some View {
        BloodOxygenChartView()
    }
}
