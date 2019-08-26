//
//  UIView+NameOfClass.swift
//  Mool
//
//  Created by Alok Choudhary on 8/25/19.
//  Copyright © 2019 Mt Aden LLC. All rights reserved.
//

import UIKit

extension UIView {
    static var nameOfClass: String {
        return String(describing: self)
    }
    
    var nameOfClass: String {
        return String(describing: type(of: self))
    }
}
