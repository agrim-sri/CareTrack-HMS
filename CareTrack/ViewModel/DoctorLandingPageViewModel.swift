//
//  DoctorLandingPageViewModel.swift
//  CareTrack
//
//  Created by Sanskriti Sinha on 28/04/23.
//

import Foundation
import Firebase

class DoctorLandingPageViewModel:ObservableObject{
    @Published var doctorDetail = [:]
    @Published var appoitementDetails = [Appointment]()
    @Published var doctor = [Doctor]()
    @Published var t = Booking()

    func getDoctorData() {
        
        let db = Firestore.firestore()
        
        let connectionRef = db.collection("Doctor")
        let docRef = connectionRef.document(Auth.auth().currentUser!.uid)
        
        docRef.getDocument { (documentSnapshot, error) in
            guard let documentSnapshot = documentSnapshot, documentSnapshot.exists else {
                print("Document does not exist")
                return
            }
            
            let data = documentSnapshot.data()
            self.doctorDetail = data!
        }

        
    }
    
    func getAppoitementDeatils() async{
        let db = Firestore.firestore()
        
        let collectionRef = db.collection("Appointment")
        let query = collectionRef.whereField("DoctorId", isEqualTo: Auth.auth().currentUser!.uid)
        print(Auth.auth().currentUser!.uid)
        
        await query.getDocuments { snapshot, error in
             
             // Check for errors
             if error == nil {
                 // No errors

                 if let snapshot = snapshot {
                     // Update the list property in the main thread
                     DispatchQueue.main.async {
                         // Get all the documents and create Todos
                         self.appoitementDetails = snapshot.documents.map { d in
                             
                             // Create a Todo item for each document returned
                             print(d["PatientName"])
                             return Appointment(doctorId: d["DoctoId"] as? String ?? "", patientId: d["PatientId"] as? String ?? "", date: d["Date"] as? Int ?? 0, doctorName: d["DoctorName"] as? String ?? "",department: d["Department"] as? String ?? "",patientName: d["PatientName"] as? String ?? "", time: d["Time"] as? String ?? "")
                             
                         }
                     }
                     
                     
                     
                 }
             }
             else {
                 // Handle the error
             }
         }
        
        print("si")
        print(t.date)
        
        
    }
    
    func createDateTime(timestamp: String) -> String {
        var strDate = "undefined"
            
        if let unixTime = Double(timestamp) {
            let date = Date(timeIntervalSince1970: unixTime)
            let dateFormatter = DateFormatter()
            let timezone = TimeZone.current.abbreviation() ?? "IST"  // get current TimeZone abbreviation or set to CET
            dateFormatter.timeZone = TimeZone(abbreviation: timezone) //Set timezone that you want
            dateFormatter.locale = NSLocale.current
            dateFormatter.dateFormat = "dd.MM.yyyy" //Specify your format that you want
            strDate = dateFormatter.string(from: date)
        }
            
        return strDate
    }
}

