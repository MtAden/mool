//
//  UIView+NameOfClass.swift
//  Mool
//
//  Created by Alok Choudhary on 8/25/19.
//  Copyright © 2019 Mt Aden LLC. All rights reserved.
//

#if canImport(UIKit) && os(iOS)
import UIKit

extension UIView {
    /// static func to get name of the class as string.
    static var nameOfClass: String {
        return String(describing: self)
    }
    
    
    /// Computated property to get class name 
    var nameOfClass: String {
        return String(describing: type(of: self))
    }
}

#endif
