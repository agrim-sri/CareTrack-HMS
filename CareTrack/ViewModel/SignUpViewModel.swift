//
//  SignUpViewModel.swift
//  CareTrack
//
//  Created by Prakhar Parakh on 16/04/23.
//

import Foundation
import FirebaseSharedSwift
import FirebaseFirestore

final class SignUpViewModel: ObservableObject{
    
    func registerUser(id: String,name: String, age: Int, phone: String, gender: String){
        let db = Firestore.firestore()
        db.collection("Patient").document(id).setData(["id": id,
                                                        "name" : name,
                                                        "gender": gender,
                                                        "phone" : phone,
                                                        "age": age])
    }
}

