//
//  Doctor.swift
//  CareTrack
//
//  Created by Agrim Srivastava on 20/04/23.
//

import Foundation

struct Doctor: Identifiable {
    
    var id: String
    var name: String
    var email: String?
    //var isDoctor: Bool
    var department: String
    //var unavailability: [Date]
    var Qualification: String
    var Experience: Int
    var gender:String
    var phone:Int
    var Age:Int
    
    //var image: UIImage?
}

