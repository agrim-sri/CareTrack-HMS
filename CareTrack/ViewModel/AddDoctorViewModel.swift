//
//  AddDoctorViewModel.swift
//  CareTrack
//
//  Created by Prakhar Parakh on 02/05/23.
//

import Foundation
import Firebase
import FirebaseAuth

class AddDoctorViewModel:ObservableObject{
    
    @Published var doctor = [Doctor]()
    
    
    func addDoctor(id:String, name:String, phone:Int, email:String, department:String, gender: String, age: Int, experience: Int, qualification: String){
        
        let db = Firestore.firestore()
        db.collection("Doctor").addDocument(data:
                                                ["id": id,
                                                     "name": name,
                                                     "email": email,
                                                     "phone": phone,
                                                     "department": department,
                                                     "Age": age,
                                                     "Experience": experience,
                                                     "Gender":gender,
                                                     "Qualification":qualification]) { error in
            if (error != nil){
                print(error!)
            }
        }
    }
}

