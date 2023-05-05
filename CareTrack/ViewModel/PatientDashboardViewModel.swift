//
//  PatientDashboardViewModel.swift
//  CareTrack
//
//  Created by Sanskriti Sinha on 30/04/23.
//

import Foundation
import Firebase
import FirebaseFirestore

class PatientDashboardViewModel: ObservableObject{
    @Published var user = [Patient]()
    @Published var appointments = [Appointment]()
    @Published var doctorDetails = [Doctor]()
    func getUser(){
        let db = Firestore.firestore()
        
        let collectionRef = db.collection("Patient")
        let query = collectionRef
            .whereField("id", isEqualTo: Auth.auth().currentUser!.uid)
        
        
        query.getDocuments { snapshot, error in
             
             // Check for errors
             if error == nil {
                 // No errors
                 if let snapshot = snapshot {
                     // Update the list property in the main thread
                     DispatchQueue.main.async {
                         // Get all the documents and create Todos
                         self.user = snapshot.documents.map { d in
                             // Create a Todo item for each document returned
                             return Patient(id: d["id"] as? String ?? "", name: d["name"] as? String ?? "",age: d["age"] as? Int ?? 0, gender:d["gender"] as? String ?? "")
                             
                         }
                     }
                 }
             }
             else {
                 // Handle the error
             }
         }
        getUserAppointment()
        
    }
    
    func getUserAppointment(){
        let db = Firestore.firestore()
        
        let collectionRef = db.collection("Appointment")
        let query = collectionRef.whereField("PatientId", isEqualTo: Auth.auth().currentUser!.uid)
        
        query.getDocuments { snapshot, error in
             
             // Check for errors
             if error == nil {
                 // No errors

                 if let snapshot = snapshot {
                     // Update the list property in the main thread
                     DispatchQueue.main.async { [self] in
                         // Get all the documents and create Todos
                         self.appointments = snapshot.documents.map { d in
                             
                             // Create a Todo item for each document returned
                             
                             return Appointment(doctorId: d["DoctoId"] as? String ?? "", patientId: d["PatientId"] as? String ?? "", date: d["Date"] as? Int ?? 0, doctorName: d["DoctorName"] as? String ?? "",department: d["Department"] as? String ?? "",patientName: d["PatientName"] as? String ?? "", time: d["Time"] as? String ?? "")
                         }
                     }
                 }
             }
             else {
                 // Handle the error
             }
         }
    }
    
    
}

