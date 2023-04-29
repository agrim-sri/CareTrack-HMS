//
//  DoctorSelectionViewModel.swift
//  CareTrack
//
//  Created by Agrim Srivastava on 24/04/23.
//

import Foundation
import Firebase

class DoctorSelectionViewModel: ObservableObject {
    
    @Published var list = [Doctor]()
    
    func getData() {
        
        // Get a reference to the database
        let db = Firestore.firestore()
        
        // Read the documents at a specific path
        db.collection("Doctor").getDocuments { snapshot, error in
            
            // Check for errors
            if error == nil {
                // No errors

                if let snapshot = snapshot {
                    // Update the list property in the main thread
                    DispatchQueue.main.async {
                        // Get all the documents and create Todos
                        self.list = snapshot.documents.map { d in
                            
                            // Create a Todo item for each document returned
                            
                            return Doctor(id: d["id"] as? String ?? "", name: d["name"] as? String ?? "", department: d["department"] as? String ?? "", Qualification: d["Qualification"] as? String ?? "", Experience: d["Experience"] as? Int ?? 0, gender: d["Gender"] as? String ?? "", phone: d["phone"] as? Int ?? 0, Age: d["Age"] as? Int ?? 0)
                            
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
