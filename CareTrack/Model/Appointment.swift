//
//  Appointment.swift
//  CareTrack
//
//  Created by Agrim Srivastava on 20/04/23.
//

import Foundation
import SwiftUI

enum Status{
    case Upcomming
    case Completed
}

struct Appointment{
    var appointmentId: String
    var doctorId: String
    var patientId: String
    var payIsSuccess : Bool
    var date: Date
    
}

