//
//  SlotBookViewModel.swift
//  CareTrack
//
//  Created by Agrim Srivastava on 24/04/23.
//

import Foundation
import Firebase


class SlotBookViewModel: ObservableObject {
    
    func addData(doctorId: String, patientId: String, Date: Date, payment: Bool = true, slots: String) {
        

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let dateString = dateFormatter.string(from: Date)
        let date = dateFormatter.date(from: dateString)!
        let calendar = Calendar.current
        var components = calendar.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date)
        components.hour = 9
        components.minute = 30
        
        print(components)
        
        let updatedDate = calendar.date(from: components)!
        let updatedDateString = dateFormatter.string(from: updatedDate)
        print(updatedDateString)
        
        var timeStamp :Int = 0
        
        if let fdate = dateFormatter.date(from: updatedDateString) {
            timeStamp = Int(fdate.timeIntervalSince1970)

        }
        
            // Get a reference to the database
            let db = Firestore.firestore()
            
            // Add a document to a collection
            db.collection("Appointment").addDocument(data:
                                                        ["Date": timeStamp,
                                                         "DoctorId": doctorId,
                                                         "PatientId": patientId,
                                                         "Payment": payment,
                                                         "Slots": slots]) { error in
                if (error != nil){
                    print(error!)
                }
            }
        }
}
