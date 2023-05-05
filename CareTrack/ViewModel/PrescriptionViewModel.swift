//
//  PrescriptionViewModel.swift
//  CareTrack
//
//  Created by Prakhar Parakh on 03/05/23.
//

import Foundation
import Firebase
import FirebaseFirestore
import FirebaseSharedSwift

class PrescriptionViewModel: ObservableObject{
    @Published var prescriptionData = [Prescription]()
    @Published var patientPrescriptionData = [Prescription]()
    @Published var medicine = [Prescription]()
    @Published var percentComplect: [Int] = []
    @Published var percentComplect1: [Double] = []
    @Published var totalDay: [Int] = []

    
    func getUser() {
        let db = Firestore.firestore()
        let collectionRef = db.collection("Prescription")
        
        let query = collectionRef.whereField("PatientId", isEqualTo: Auth.auth().currentUser?.uid)
        query.getDocuments { (documentSnapshot, error) in
            do {
                guard let documentSnapshot = documentSnapshot else {
                    print("Document does not exist")
                    return
                }
                for document in documentSnapshot.documents{
                    let jsonEncode = try JSONSerialization.data(withJSONObject: document.data(),options: .prettyPrinted )
                    let jsonDecode = try JSONDecoder().decode(Prescription.self, from: jsonEncode)
                    print(jsonDecode)
                    self.prescriptionData.append(jsonDecode)
                    
                    
                }
            } catch {
                print(error)
            }
        }
    }
    
    func getMedicines(id: String){
        let db = Firestore.firestore()
        let collectionRef = db.collection("Prescription")
        let query = collectionRef.whereField("PatientId", isEqualTo: id)
        query.getDocuments { [self] (documentSnapshot, error) in
            do {
                guard let documentSnapshot = documentSnapshot else {
                    print("Document does not exist")
                    return
                }
                for document in documentSnapshot.documents{
                    let jsonEncode = try JSONSerialization.data(withJSONObject: document.data(),options: .prettyPrinted )
                    let jsonDecode = try JSONDecoder().decode(Prescription.self, from: jsonEncode)
                    print(jsonDecode)
                    self.medicine.append(jsonDecode)
                    print("s")
                    print(medicine)
                    for i in 0..<medicine.count{
                        for j in 0..<medicine[i].Medication.count{
                            self.percentComplect.append(Int((Double(Calendar.current.dateComponents([.day],from: Foundation.Date(milliseconds: Int64(medicine[i].Date)), to: Date.now).day!) / Double(medicine[i].Medication[j].Duration)) * 100))
                            self.percentComplect1.append(Double((Double(Calendar.current.dateComponents([.day],from: Foundation.Date(milliseconds: Int64(medicine[i].Date)), to: Date.now).day!) / Double(medicine[i].Medication[j].Duration))))
                            
                            self.totalDay.append(medicine[i].Medication[j].Morning + medicine[i].Medication[j].Afternoon + medicine[i].Medication[j].Night)
                        }
                    }
                }
            } catch {
                print(error)
            }
        }
    }
    
    func getPrescription(id: String) {
        let db = Firestore.firestore()
        let collectionRef = db.collection("Prescription")
        let query = collectionRef.whereField("id", isEqualTo: id)
        query.getDocuments { (documentSnapshot, error) in
            do {
                guard let documentSnapshot = documentSnapshot else {
                    print("Document does not exist")
                    return
                }
                for document in documentSnapshot.documents{
                    let jsonEncode = try JSONSerialization.data(withJSONObject: document.data(),options: .prettyPrinted )
                    let jsonDecode = try JSONDecoder().decode(Prescription.self, from: jsonEncode)
                    print(jsonDecode)
                    self.patientPrescriptionData.append(jsonDecode)
                }
            } catch {
                print(error)
            }
        }
    }
    
    func addPrescription(id: String, patientId: String, patientName: String, doctorId: String, doctorName: String,diagnosis: String,suggestion: String, symptoms: String, test: String,medication: [Medication]){
        let db = Firestore.firestore()
        let uuid = UUID().uuidString
        print(uuid)
        
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = DateFormatter.Style.none
        dateFormatter.dateStyle = DateFormatter.Style.full
        let dateString = dateFormatter.string(from: Date.now)
        let date = dateFormatter.date(from: dateString)!
        let calendar = Calendar.current
        var components = calendar.dateComponents([.year, .month, .day], from: date)
        components.hour = 9
        components.minute = 30
        
        print(components)
        
        let updatedDate = calendar.date(from: components)!
        let updatedDateString = dateFormatter.string(from: updatedDate)
        print(updatedDateString)
        
        var timeStamp :Int = 0
        
        if let fdate = dateFormatter.date(from: updatedDateString) {
            timeStamp = Int(fdate.timeIntervalSince1970)

        }
        
        let tempData: [String: Any] = ["id": uuid,
                                      "PatientId": patientId,
                                      "PatientName": patientName,
                                      "Suggestion": suggestion,
                                      "Symptoms": symptoms,
                                      "Test": test,
                                      "Diagnosis": diagnosis,
                                      "DoctorId": doctorId,
                                      "DoctorName": doctorName,
                                      "Medication": convertMedToDic(meds1: medication),
                                       "Date": timeStamp
                                      ]
        db.collection("Prescription").document(uuid).setData(tempData) { err in
            if let err = err {
                print("Error writing document: \(err)")
            } else {
                print("Document successfully written!")
            }
        }
        
        func convertMedToDic(meds1: [Medication]) -> [Any]{
                var meds = [Any]()
                
                for med in meds1 {
                    meds.append([
                        "Afternoon": med.Afternoon,
                        "Duration": med.Duration,
                        "MedicineName": med.MedicineName,
                        "Morning": med.Morning,
                        "Night" : med.Night,
                        "Remarks" : med.Remarks
                    ])
                }
                
                return meds
            }
        
//        let collectionRef = db.collection("Prescription").document(uuid)
//        collectionRef.setData(["prescriptionId": id,
//                                     "PatientId": patientId,
//                                     "PatientName": patientName,
//                                     "Suggestion": suggestion,
//                                     "Symptoms": symptoms,
//                                     "Test": test,
//                                     "Diagnosis": diagnosis,
//                                     "DoctorId": doctorId,
//                                     "DoctorName": doctorName
//                                     ]) { error in
//            if (error != nil){
//                print(error!)
//
//            }
////            db.collection("Prescription").document(uuid).updateData(["Medication": FieldValue.arrayUnion(medication)])
//}
        
    }
}

