//
//  UserDefaults+extension.swift
//  Mool
//
//  Created by Alok Choudhary on 6/25/20.
//  Copyright © 2020 Mt Aden LLC. All rights reserved.
//

import Foundation
extension UserDefaults {
    func string(forKey defaultName: String?, orDefault defaultValue: String?) -> String? {
        let ret = string(forKey: defaultName ?? "")
        if ret == nil {
            return defaultValue
        }
        return ret
    }

    func array(forKey defaultName: String?, orDefault defaultValue: [AnyHashable]?) -> [AnyHashable]? {
        let ret = array(forKey: defaultName ?? "")
        if ret == nil {
            return defaultValue
        }
        return ret as? [AnyHashable]
    }
    
    func dictionary(forKey defaultName: String?, orDefault defaultValue: [AnyHashable : Any]?) -> [AnyHashable : Any]? {
        let ret = dictionary(forKey: defaultName ?? "")
        if ret == nil {
            return defaultValue
        }
        return ret
    }

    func data(forKey defaultName: String?, orDefault defaultValue: Data?) -> Data? {
        let ret = data(forKey: defaultName ?? "")
        if ret == nil {
            return defaultValue
        }
        return ret
    }

    func stringArray(forKey defaultName: String?, orDefault defaultValue: [AnyHashable]?) -> [AnyHashable]? {
        let ret = stringArray(forKey: defaultName ?? "")
        if ret == nil {
            return defaultValue
        }
        return ret
    }
    
    func integer(forKey defaultName: String?, orDefault defaultValue: Int) -> Int {
        let obj = object(forKey: defaultName ?? "") as? NSObject
        if obj == nil {
            return defaultValue
        } else {
            if (obj is NSNumber) {
                return (obj as? NSNumber)?.intValue ?? 0
            } else {
                return defaultValue
            }
        }
    }

    func float(forKey defaultName: String?, orDefault defaultValue: Float) -> Float {
        let obj = object(forKey: defaultName ?? "") as? NSObject
        if obj == nil {
            return defaultValue
        } else {
            if (obj is NSNumber) {
                return (obj as? NSNumber)?.floatValue ?? 0.0
            } else {
                return defaultValue
            }
        }
    }
    
    func double(forKey defaultName: String?, orDefault defaultValue: Double) -> Double {
        let obj = object(forKey: defaultName ?? "") as? NSObject
        if obj == nil {
            return defaultValue
        } else {
            if (obj is NSNumber) {
                return (obj as? NSNumber)?.doubleValue ?? 0.0
            } else {
                return defaultValue
            }
        }
    }
    
    func bool(forKey defaultName: String?, orDefault defaultValue: Bool) -> Bool {
        let obj = object(forKey: defaultName ?? "") as? NSObject
        if obj == nil {
            return defaultValue
        } else {
            if (obj is NSNumber) {
                return (obj as? NSNumber)?.boolValue ?? false
            } else {
                return defaultValue
            }
        }
    }
}
