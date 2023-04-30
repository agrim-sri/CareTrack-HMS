//
//  PatientDashboardViewModel.swift
//  CareTrack
//
//  Created by Sanskriti Sinha on 30/04/23.
//

import Foundation
import Firebase

class PatientDashboardViewModel: ObservableObject{
    @Published var user = [Patient]()
    
    func getUser(){
        let db = Firestore.firestore()
        
        let collectionRef = db.collection("Patient")
        let query = collectionRef.whereField("id", isEqualTo: Auth.auth().currentUser!.uid)
        
        
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
                             
                             return Patient(id: d["id"] as? String ?? "", name: d["name"] as? String ?? "")
                             
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
