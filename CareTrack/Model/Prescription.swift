//
//  Presciription.swift
//  CareTrack
//
//  Created by Prakhar Parakh on 03/05/23.
//

import Foundation
import Firebase

struct Prescription: Codable,Identifiable{
    
    var id:String
    var Diagnosis:String
    var DoctorId:String
    var DoctorName:String
    var PatientName:String
    var PatientId:String
    var Suggestion:String
    var Symptoms:String
    var Test:String
    var Medication: [Medication]
    var Date: Int
}

struct Medication: Codable {
    var Afternoon:Int
    var Duration:Int
    var MedicineName:String
    var Morning:Int
    var Night:Int
    var Remarks:String
}

