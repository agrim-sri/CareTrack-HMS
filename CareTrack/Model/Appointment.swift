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
    case Cancelled
}

class Appointment{
    let appointmentId: String
    let doctorId: String
    let patientId: String
    var payIsSuccess : Bool
    var status: Status
    
    init(appointmentId: String, doctorId: String, patientId: String, payIsSuccess: Bool, status: Status) {
        self.appointmentId = appointmentId
        self.doctorId = doctorId
        self.patientId = patientId
        self.payIsSuccess = payIsSuccess
        self.status = Status.Upcomming
    }
}

class Appointments {
    var appointments: [Appointment]
    
    init(appointments: [Appointment]) {
        self.appointments = appointments
    }
}
