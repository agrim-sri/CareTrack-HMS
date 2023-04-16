//
//  SignUpViewModel.swift
//  CareTrack
//
//  Created by Prakhar Parakh on 16/04/23.
//

import Foundation
import Firebase
final class SignUpViewModel: ObservableObject{
    
    func registerUser(email: String, password: String){
        Auth.auth().createUser(withEmail: email, password: password)
    }
}
