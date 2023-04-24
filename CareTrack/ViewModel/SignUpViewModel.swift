//
//  SignUpViewModel.swift
//  CareTrack
//
//  Created by Prakhar Parakh on 16/04/23.
//

import Foundation
import Firebase
final class SignUpViewModel: ObservableObject{
    
    func registerUser(email: String, password: String, name: String, age: Int, pNumber: Int, Gender: String){
        Auth.auth().createUser(withEmail: email, password: password){
            pa, error in
            if(error == nil)
            {
                if let user = pa?.user{
                    let uid = user.uid
                    
                    let db = Firestore.firestore()
                    
                    db.collection("Patient").document(uid).setData(["Name" : name,
                                                                    "Email": email,
                                                                    "Gender": Gender,
                                                                    "pNumber" : pNumber,
                                                                    "Age": age])
                    
                    
                }
            }
        }
    }
}
