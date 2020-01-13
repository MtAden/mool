//
//  Date+extension.swift
//  Mool
//
//  Created by Alok Choudhary on 3/5/19.
//  Copyright © 2019 Alok Choudhary. All rights reserved.
//

import Foundation
extension Date {
    func reduceToMonthDayYear() -> Date {
        let calendar = Calendar.current
        let month = calendar.component(.month, from: self)
        let day = calendar.component(.day, from: self)
        let year = calendar.component(.year, from: self)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        return dateFormatter.date(from: "\(month)/\(day)/\(year)") ?? Date()
    }
    
    func convertStringToIso8601(date string: String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        return dateFormatter.date(from:string)
    }
    
    func convertDate_YYYY_MM_DD(date string: String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        return dateFormatter.date(from: string)
    }
    
    func convertTime_HH_mm(date string: String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm:ss"
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        return dateFormatter.date(from: string)
    }
    
    static func now() -> Date {
        return Date()
    }
    
    func utcToLocalTimeDate() -> Date? {
        let dateFormatter = DateFormatter()
        let dateString = dateFormatter.string(from: self)
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        dateFormatter.timeZone = TimeZone.current
        let localDate = dateFormatter.date(from: dateString)
        
        return localDate
    }
    
    func convertStringDateStringTimeToIso8601(date: String, time: String?, timeZone: String) -> Date? {
        let dateFormatter = DateFormatter()
        var finalDate: Date?
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.timeZone = TimeZone(abbreviation: timeZone)
        
        if let time = time {
            finalDate = self.combineDateWithTime(dateString: date, timeString: time, timeZoneString: timeZone)
            return finalDate
        }
        
        finalDate = self.combineDateWithTime(dateString: date, timeString: "00:00:00", timeZoneString: timeZone)
        return finalDate
    }
    
    func combineDateWithTime(date: Date, time: Date) -> Date? {
        let calendar = Calendar.current
        
        let dateComponents = calendar.dateComponents([.year, .month, .day], from: date)
        let timeComponents = calendar.dateComponents([.hour, .minute, .second], from: time)
        
        var mergedComponments = DateComponents()
        mergedComponments.year = dateComponents.year
        mergedComponments.month = dateComponents.month
        mergedComponments.day = dateComponents.day
        mergedComponments.hour = timeComponents.hour
        mergedComponments.minute = timeComponents.minute
        mergedComponments.second = timeComponents.second
        
        return calendar.date(from: mergedComponments)
    }
    
    func combineDateWithTime(dateString: String, timeString: String, timeZoneString: String? = nil) -> Date? {
        var calendar = Calendar.current
        if let timeZoneString = timeZoneString, let timeZone = TimeZone(abbreviation: timeZoneString) {
            calendar.timeZone = timeZone
        }
        
        guard let date = self.convertDate_YYYY_MM_DD(date: dateString),
            let time = self.convertTime_HH_mm(date: timeString)
            else { return nil }
        
        let dateComponents = calendar.dateComponents([.year, .month, .day], from: date)
        let timeComponents = calendar.dateComponents([.hour, .minute, .second], from: time)
        
        var mergedComponments = DateComponents()
        mergedComponments.year = dateComponents.year
        mergedComponments.month = dateComponents.month
        mergedComponments.day = dateComponents.day
        mergedComponments.hour = timeComponents.hour
        mergedComponments.minute = timeComponents.minute
        mergedComponments.second = timeComponents.second
        
        return calendar.date(from: mergedComponments)
    }
    
    func combineDateWith(timeZoneString: String) -> Date? {
        var calendar = Calendar.current
        if let timeZone = TimeZone(abbreviation: timeZoneString) {
            calendar.timeZone = timeZone
        }
        
        let dateComponents = calendar.dateComponents([.year, .month, .day], from: self)
        
        var mergedComponments = DateComponents()
        mergedComponments.year = dateComponents.year
        mergedComponments.month = dateComponents.month
        mergedComponments.day = dateComponents.day
        mergedComponments.hour = dateComponents.hour
        mergedComponments.minute = dateComponents.minute
        mergedComponments.second = dateComponents.second
        
        return calendar.date(from: mergedComponments)
    }
}


public extension Date {
    
    func getCurrentDay() -> Int {
        let calendar = Calendar.current
        let day = calendar.component(.day, from: self)
        
        return day
    }
    
    func getCurrentMonth() -> Int {
        let calendar = Calendar.current
        let month = calendar.component(.month, from: self)
        
        return month
    }
    
    func getCurrentYear() -> Int {
        let calendar = Calendar.current
        let year = calendar.component(.year, from: self)
        
        return year
    }
}
