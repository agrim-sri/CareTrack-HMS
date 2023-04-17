//
//  LogInView.swift
//  CareTrack
//
//  Created by Sanskriti Sinha on 16/04/23.
//

import Foundation
import Firebase

final class LogInViewModel : ObservableObject {
    func verifyUser(email: String, password: String)-> Bool{
        Auth.auth().signIn(withEmail: email, password: password){ result, error in
            
            if(error != nil){
                print(error?.localizedDescription)
                return
            }
            
            print("Welcome!")
        }
        return true
    }
}

