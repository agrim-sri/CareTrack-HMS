//
//  HealthKitViewModel.swift
//  CareTrack
//
//  Created by Sanskriti Sinha on 26/04/23.
//

import SwiftUI
import HealthKit

class HealthKitViewModel: ObservableObject {
    private var healthStore = HKHealthStore()
    private var healthKitManager = HealthKitManager()
    @Published var userStepCount = ""
    @Published var sleepAmount = "0"
    @Published var isAuthorized = false
    @Published var height = ""
    @Published var weight = ""
    @Published var heart = ""
    @Published var respiration = ""
    
    func healthRequest() {
        healthKitManager.setUpHealthRequest(healthStore: healthStore) { [self] in
            self.changeAuthorizationStatus()
            self.readStepsTakenToday()
            healthKitManager.setUpHealthRequestForSleep(healthStore: healthStore) {
                self.readSleepTakenToday()
            }
            healthKitManager.setUpHealthRequestForHeight(healthStore: healthStore){
                self.readheight()
            }
            healthKitManager.setUpHealthRequestForWeight(healthStore: healthStore){
                self.readweight()
            }
            healthKitManager.setUpHealthRequestForHeartRate(healthStore: healthStore){
                self.readheart()
            }
            healthKitManager.setUpHealthRequestForRespiration(healthStore: healthStore) {
                self.readrespiration()
            }
        }
        
    }
    
    func readStepsTakenToday() {
        healthKitManager.readStepCount(forToday: Date(), healthStore: healthStore) { step in
            if step != 0.0 {
                DispatchQueue.main.async {
                    self.userStepCount = String(format: "%.0f", step)
                }
            }
        }
    }
    
    
    func readSleepTakenToday() {
        print("heya")
        healthKitManager.readSleepAmount(forDate: Date.now, healthStore: healthStore) { sleep in
            print("hi")
                if sleep != 0.0 {
                    DispatchQueue.main.async {
                        self.sleepAmount = String(format: "%.2f", sleep)
                        print("hi")

                    }
                    
                }
            
        }
//        self.sleepAmount = String(format: "%.2f",healthKitManager.sleepAmount)
    }
    
    func readheight() {
        print("heya")
        healthKitManager.getHeight(healthStore: healthStore) { height in
            print("hi")
                if height != 0.0 {
                    DispatchQueue.main.async {
                        self.height = String(format: "%.0f", height * 100)
                        print("hi")

                    }
                    
                }
            
        }
//        self.sleepAmount = String(format: "%.2f",healthKitManager.sleepAmount)
    }
    
    
    func readweight() {
        print("heya")
        healthKitManager.getWeight(healthStore: healthStore) { weight in
            print("hi")
                if weight != 0.0 {
                    DispatchQueue.main.async {
                        self.weight = String(format: "%.0f", weight / 1000)
                        print("hi")

                    }
                    
                }
            
        }
//        self.sleepAmount = String(format: "%.2f",healthKitManager.sleepAmount)
    }
    
    func readheart(){
        healthKitManager.readHeartRate(healthStore: healthStore) { heart in
            if heart != 0.0{
                DispatchQueue.main.async {
                    self.heart = String(format: "%.0f",heart)
                }
            }
        }
    }
    
    func readrespiration(){
        healthKitManager.getRespiratoryRateSamples(healthStore: healthStore) { respiration in
            if respiration != 0.0{
                DispatchQueue.main.async {
                    self.respiration = String(format: "%.0f",respiration)
                }
            }
        }
    }
    
    
    
    

    
    func changeAuthorizationStatus() {
        
        let types = Set([HKObjectType.quantityType(forIdentifier: .stepCount)!,
                                HKObjectType.categoryType(forIdentifier: .sleepAnalysis)!,
                         HKQuantityType.quantityType(forIdentifier: .height)!,
                         HKQuantityType.quantityType(forIdentifier: .bodyMass)!
                            ]
                )
                
                
                healthStore.requestAuthorization(toShare: types, read: types) {  (success, error) in
                    if !success {
                        // Handle the error here.
                    }
                    self.isAuthorized = true
                }
    }
    
//    func setUpHealthRequest(healthStore: HKHealthStore, readSteps: @escaping () -> Void, readSleep: @escaping () -> Void) {
//        if HKHealthStore.isHealthDataAvailable(), let stepCount = HKObjectType.quantityType(forIdentifier: HKQuantityTypeIdentifier.stepCount), let sleepType = HKObjectType.categoryType(forIdentifier: HKCategoryTypeIdentifier.sleepAnalysis) {
//            healthStore.requestAuthorization(toShare: [stepCount], read: [stepCount, sleepType]) { success, error in
//                if success {
//                    readSteps()
//                    readSleep()
//                } else if error != nil {
//                    // handle your error here
//                }
//            }
//        }
//    }

    
    



}

