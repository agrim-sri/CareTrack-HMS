//
//  HealthKitManager.swift
//  CareTrack
//
//  Created by Sanskriti Sinha on 26/04/23.
//

import SwiftUI
import HealthKit

extension Date {

    static func - (lhs: Date, rhs: Date) -> TimeInterval {
        return lhs.timeIntervalSinceReferenceDate - rhs.timeIntervalSinceReferenceDate
    }

}

extension Date {
    static var yesterday: Date { return Date().dayBefore }
    static var tomorrow:  Date { return Date().dayAfter }
    var dayBefore: Date {
        return Calendar.current.date(byAdding: .day, value: -1, to: noon)!
    }
    var dayAfter: Date {
        return Calendar.current.date(byAdding: .day, value: 1, to: noon)!
    }
    var noon: Date {
        return Calendar.current.date(bySettingHour: 12, minute: 0, second: 0, of: self)!
    }
    var month: Int {
        return Calendar.current.component(.month,  from: self)
    }
    var isLastDayOfMonth: Bool {
        return dayAfter.month != month
    }
}

class HealthKitManager {
    
    var sleepAmount : Double = 0.0
    @StateObject var v = HealthKitViewModel()
    
    func setUpHealthRequest(healthStore: HKHealthStore, readSteps: @escaping () -> Void) {
        if HKHealthStore.isHealthDataAvailable(), let stepCount = HKObjectType.quantityType(forIdentifier: HKQuantityTypeIdentifier.stepCount) {
            healthStore.requestAuthorization(toShare: [stepCount], read: [stepCount]) { success, error in
                if success {
                    readSteps()
                } else if error != nil {
                    // handle your error here
                }
            }
        }
    }
    
    func setUpHealthRequestForSleep(healthStore: HKHealthStore, readSleep: @escaping () -> Void) {
        if HKHealthStore.isHealthDataAvailable(), let sleepType = HKObjectType.categoryType(forIdentifier: HKCategoryTypeIdentifier.sleepAnalysis) {
            healthStore.requestAuthorization(toShare: nil, read: [sleepType]) { success, error in
                if success {
                    readSleep()
                } else if let error = error {
                    // Handle your error here
                }
            }
        }
    }
    
    func setUpHealthRequestForHeight(healthStore: HKHealthStore, readHeight: @escaping () -> Void){
        if HKHealthStore.isHealthDataAvailable(), let heightType = HKObjectType.quantityType(forIdentifier: .height){
            healthStore.requestAuthorization(toShare: nil, read: [heightType]) { success, error in
                if success{
                    readHeight()
                } else if let error = error{
                    
                }
            }
        }
    }
    
    func setUpHealthRequestForWeight(healthStore: HKHealthStore, readWeight: @escaping () -> Void){
        if HKHealthStore.isHealthDataAvailable(), let weightType = HKObjectType.quantityType(forIdentifier: .bodyMass){
            healthStore.requestAuthorization(toShare: nil, read: [weightType]) { success, error in
                if success{
                    readWeight()
                } else if let error = error{
                    
                }
            }
        }
    }
    
    func setUpHealthRequestForHeartRate(healthStore: HKHealthStore, readHeart: @escaping () -> Void){
        if HKHealthStore.isHealthDataAvailable(), let heartrateType = HKObjectType.quantityType(forIdentifier: .heartRate){
            healthStore.requestAuthorization(toShare: nil, read: [heartrateType]) { success, error in
                if success{
                    readHeart()
                } else if let error = error{
                    
                }
            }
        }
    }
    
    func setUpHealthRequestForRespiration(healthStore: HKHealthStore, readRespiration: @escaping () -> Void){
        if HKHealthStore.isHealthDataAvailable(), let respirationType = HKObjectType.quantityType(forIdentifier: .respiratoryRate){
            healthStore.requestAuthorization(toShare: nil, read: [respirationType]) { success, error in
                if success{
                    readRespiration()
                } else if let error = error{
                    
                }
            }
        }
    }
    
    
    
    
    
    
    
    func readStepCount(forToday: Date, healthStore: HKHealthStore, completion: @escaping (Double) -> Void) {
        guard let stepQuantityType = HKQuantityType.quantityType(forIdentifier: .stepCount) else { return }
        let now = Date()
        let startOfDay = Calendar.current.startOfDay(for: now)
        
        let predicate = HKQuery.predicateForSamples(withStart: startOfDay, end: now, options: .strictStartDate)
        
        let query = HKStatisticsQuery(quantityType: stepQuantityType, quantitySamplePredicate: predicate, options: .cumulativeSum) { _, result, error in
            
            guard let result = result, let sum = result.sumQuantity() else {
                completion(0.0)
                return
            }
            
            completion(sum.doubleValue(for: HKUnit.count()))
            
        }
        
        healthStore.execute(query)
        
    }
    
    func readSleepAmount(forDate date: Date,healthStore: HKHealthStore, completion: @escaping (Double) -> Void) {
//        guard let sleepType = HKObjectType.categoryType(forIdentifier: .sleepAnalysis) else { return }
//        let predicate = HKQuery.predicateForSamples(withStart: date.dayBefore, end: Date(), options: .strictEndDate)
//        let query = HKSampleQuery(sampleType: sleepType, predicate: predicate, limit: HKObjectQueryNoLimit, sortDescriptors: nil) { [self] query, results, error in
//            if let sleepSamples = results as? [HKCategorySample] {
//                let totalDuration = sleepSamples.reduce(0.0) { $0 + $1.endDate.timeIntervalSince($1.startDate) }
//                let minutes = totalDuration / 60.0
//                self.sleepAmount = minutes / 60.0
//                print(self.sleepAmount)
//                completion(self.sleepAmount)
//
//            } else {
//                DispatchQueue.main.async {
//                    self.sleepAmount = 0
//                }
//            }
//        }
//        healthStore.execute(query)
        
        
        if let sleepType = HKObjectType.categoryType(forIdentifier: HKCategoryTypeIdentifier.sleepAnalysis) {

                // Use a sortDescriptor to get the recent data first
                let sortDescriptor = NSSortDescriptor(key: HKSampleSortIdentifierEndDate, ascending: false)

                // we create our query with a block completion to execute
                let query = HKSampleQuery(sampleType: sleepType, predicate: nil, limit: 130, sortDescriptors: [sortDescriptor]) { (query, tmpResult, error) -> Void in

                    if error != nil {

                        // something happened
                        return

                    }

                    if let result = tmpResult {

                        // do something with my data
                        var sTime: Double = 0
                        for item in result {
                            if let sample = item as? HKCategorySample {
                                let value = (sample.value == HKCategoryValueSleepAnalysis.inBed.rawValue) ? "InBed" : "Asleep"
                                if value == "Asleep" && sample.startDate > Date().dayBefore{
                                    print("Healthkit sleep: \(sample.startDate.formatted(date: .abbreviated, time: .standard)) \(sample.endDate.formatted(date: .abbreviated, time: .standard)) - value: \(value)")
                                    sTime += sample.endDate - sample.startDate


                                }
                                print("e = \(sTime)")
                            }
                        }
                        completion(sTime / 3600)
                    }
                    
                }

                // finally, we execute our quer/
            healthStore.execute(query)
            }
        
        

        
    }
    
    func getHeight(healthStore: HKHealthStore, complection: @escaping (Double) -> Void) {
        guard let heightType = HKObjectType.quantityType(forIdentifier: .height) else {
            print("Height data type is no longer available in HealthKit")
            return
        }
        
        let query = HKStatisticsQuery(quantityType: heightType, quantitySamplePredicate: nil, options: .mostRecent) { (query, result, error) in
            guard let result = result, let height = result.mostRecentQuantity()?.doubleValue(for: HKUnit.meter()) else {
                print("Could not retrieve height from HealthKit")
                return
            }
            complection(height)
        }
        healthStore.execute(query)
    }
    
    func getWeight(healthStore: HKHealthStore, complection: @escaping (Double) -> Void) {
        guard let weightType = HKObjectType.quantityType(forIdentifier: .bodyMass) else {
            print("Weight data type is no longer available in HealthKit")
            return
        }
        
        let query = HKStatisticsQuery(quantityType: weightType, quantitySamplePredicate: nil, options: .mostRecent) { (query, result, error) in
            guard let result = result, let weight = result.mostRecentQuantity()?.doubleValue(for: HKUnit.gram()) else {
                print("Could not retrieve height from HealthKit")
                return
            }
            complection(weight)
        }
        healthStore.execute(query)
    }
    
    func readHeartRate(healthStore: HKHealthStore,completion: @escaping (Double) -> Void) {
            let heartRateType = HKObjectType.quantityType(forIdentifier: .heartRate)!
            
            let sortDescriptor = NSSortDescriptor(key: HKSampleSortIdentifierStartDate, ascending: false)
            let query = HKSampleQuery(sampleType: heartRateType, predicate: nil, limit: 1, sortDescriptors: [sortDescriptor]) { (query, samples, error) in
                if let error = error {
                    print("An error occurred while fetching the latest heart rate sample: \(error.localizedDescription)")
                    return
                }
                
                guard let sample = samples?.first as? HKQuantitySample else {
                    print("No heart rate samples found.")
                    return
                }
                
                completion(sample.quantity.doubleValue(for: HKUnit.count().unitDivided(by: HKUnit.minute())))
            }
            
            healthStore.execute(query)
        }
    
    
    func getRespiratoryRateSamples(healthStore: HKHealthStore,completion: @escaping (Double) -> Void) {
        guard let sampleType = HKSampleType.quantityType(forIdentifier: .respiratoryRate) else {
            print("Respiratory rate sample type not available")
            return
        }

        let sortDescriptor = NSSortDescriptor(key: HKSampleSortIdentifierEndDate, ascending: false)
        let query = HKSampleQuery(sampleType: sampleType, predicate: nil, limit: HKObjectQueryNoLimit, sortDescriptors: [sortDescriptor]) { (query, samples, error) in
            guard let samples = samples as? [HKQuantitySample], let quantity = samples.first?.quantity else {
                print("No respiratory rate samples available")
                return
            }

            let value = quantity.doubleValue(for: HKUnit(from: "count/min"))
            print("Respiratory rate: \(value) count/min")
            completion(value)
        }

        healthStore.execute(query)
    }

    
}


