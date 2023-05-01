//
//  Appointment.swift
//  CareTrack
//
//  Created by Agrim Srivastava on 20/04/23.
//

import Foundation
import SwiftUI
import Firebase

enum Status{
    case Upcomming
    case Completed
}

struct Appointment{
    var doctorId: String
    var patientId: String
    var date: Int
    var patientName: String
    var time: String
    
}

