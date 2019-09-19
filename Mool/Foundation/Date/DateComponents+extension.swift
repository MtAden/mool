//
//  DateComponents+extension.swift
//  Mool
//
//  Created by Alok Choudhary on 9/19/19.
//  Copyright © 2019 Mt Aden LLC. All rights reserved.
//

import Foundation

extension DateComponents {
    var fromNow: Date {
        return Calendar.current.date(byAdding: self,
                                     to: Date())!
    }
    
    var ago: Date {
        return Calendar.current.date(byAdding: -self,
                                     to: Date())!
    }
    
    static func + (_ lhs: DateComponents, _ rhs: DateComponents) -> DateComponents {
        return self.combineComponents(lhs, rhs)
    }
    
    static func - (_ lhs: DateComponents, _ rhs: DateComponents) -> DateComponents {
        return self.combineComponents(lhs, rhs, multiplier: -1)
    }
    
    static func combineComponents(_ lhs: DateComponents, _ rhs: DateComponents, multiplier: Int = 1) -> DateComponents {
        var result = DateComponents()
        result.second = (lhs.second ?? 0) + (rhs.second ?? 0) * multiplier
        result.minute = (lhs.minute ?? 0) + (rhs.minute ?? 0) * multiplier
        result.hour = (lhs.hour ?? 0) + (rhs.hour ?? 0) * multiplier
        result.day = (lhs.day ?? 0) + (rhs.day ?? 0) * multiplier
        result.weekOfYear = (lhs.weekOfYear ?? 0) + (rhs.weekOfYear ?? 0) * multiplier
        result.month = (lhs.month ?? 0) + (rhs.month ?? 0) * multiplier
        result.year = (lhs.year ?? 0) + (rhs.year ?? 0) * multiplier
        return result
    }
    
    static prefix func -(components: DateComponents) -> DateComponents {
        var result = DateComponents()
        if components.second != nil { result.second = -components.second! }
        if components.minute != nil { result.minute = -components.minute! }
        if components.hour != nil { result.hour = -components.hour! }
        if components.day != nil { result.day = -components.day! }
        if components.weekOfYear != nil { result.weekOfYear = -components.weekOfYear! }
        if components.month != nil { result.month = -components.month! }
        if components.year != nil { result.year = -components.year! }
        return result
    }
    
    // Date + DateComponents
    static func + (_ lhs: Date, _ rhs: DateComponents) -> Date {
        return Calendar.current.date(byAdding: rhs, to: lhs)!
    }
    
    // DateComponents + Dates
    static func + (_ lhs: DateComponents, _ rhs: Date) -> Date {
        return rhs + lhs
    }
    
    // Date - DateComponents
    static func - (_ lhs: Date, _ rhs: DateComponents) -> Date {
        return lhs + (-rhs)
    }
}

// MARK: More english friendly version like 2.hours

extension Int {
    var second: DateComponents {
        var components = DateComponents()
        components.second = self
        return components
    }
    
    var seconds: DateComponents {
        return self.second
    }
    
    var minute: DateComponents {
        var components = DateComponents()
        components.minute = self
        return components
    }
    
    var minutes: DateComponents {
        return self.minute
    }
    
    var hour: DateComponents {
        var components = DateComponents()
        components.hour = self
        return components
    }
    
    var hours: DateComponents {
        return self.hour
    }
    
    var day: DateComponents {
        var components = DateComponents()
        components.day = self
        return components
    }
    
    var days: DateComponents {
        return self.day
    }
    
    var week: DateComponents {
        var components = DateComponents()
        components.weekOfYear = self
        return components
    }
    
    var weeks: DateComponents {
        return self.week
    }
    
    var month: DateComponents {
        var components = DateComponents()
        components.month = self
        return components
    }
    
    var months: DateComponents {
        return self.month
    }
    
    var year: DateComponents {
        var components = DateComponents()
        components.year = self
        return components
    }
    
    var years: DateComponents {
        return self.year
    }
}

