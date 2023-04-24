//
//  Doctor.swift
//  CareTrack
//
//  Created by Agrim Srivastava on 20/04/23.
//

import Foundation
import SwiftUI

struct Doctor: Identifiable {
    
    var id: String
    var name: String
    var email: String?
    //var isDoctor: Bool
    var department: String
    //var unavailability: [Date]
    var qualification: String
    var yearsOfExperience: Int
    //var image: UIImage?
}

