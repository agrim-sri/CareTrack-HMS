//
//  Doctor.swift
//  CareTrack
//
//  Created by Agrim Srivastava on 20/04/23.
//

import Foundation
import SwiftUI

class Doctor: Identifiable, ObservableObject {
    
    let doctorID: String
    var name: String
    var email: String?
    //var isDoctor: Bool
    var department: String
    var unavailability: [Date]
    var qualification: String
    var yearsOfExperience: Int
    var image: UIImage?
    
    init(doctorID: String, name: String, email: String?, department: String, unavailability: [Date], qualification: String, yearsOfExperience: Int, image: UIImage?) {
        self.doctorID = doctorID
        self.name = name
        self.email = email
        //self.isDoctor = isDoctor
        self.department = department
        self.unavailability = unavailability
        self.qualification = qualification
        self.yearsOfExperience = yearsOfExperience
        self.image = image
    }
    
    enum CodingKeys: CodingKey {
        case doctorID, name, email, specialty, unavailability, qualification, yearsOfExperience, image
    }
}
