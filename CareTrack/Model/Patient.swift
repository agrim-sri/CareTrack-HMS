//
//  Patient.swift
//  CareTrack
//
//  Created by Agrim Srivastava on 20/04/23.
//

import Foundation
import SwiftUI

enum Gender {
    case male
    case female
    case nonBinary
    case preferNotToSay
}

class Patient{
    
    let firebaseId : String
    let pEmail: String
    let pName : String
    let pBirthDate : Date
    let pGender : Gender
    var pPhoneNo : String
    
    init(firebaseId: String, pEmail: String, pName: String, pBirthDate: Date, pGender: Gender, pPhoneNo: String) {
        self.firebaseId = firebaseId
        self.pEmail = pEmail
        self.pName = pName
        self.pBirthDate = pBirthDate
        self.pGender = pGender
        self.pPhoneNo = pPhoneNo
    }
    
    
    
    
}
