//
//  PatientPrescriptionView.swift
//  CareTrack
//
//  Created by Zeal Shah  on 20/04/23.
//

import SwiftUI

struct PatientPrescriptionView: View {
    var body: some View {
        Text("Prescription")
            .font(Font.custom("SF Pro Display Bold", size: 32))
            .frame(maxWidth: .infinity,alignment: .leading)
            .padding(.leading)
    }
}

struct PatientPrescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        PatientPrescriptionView()
    }
}
