//
//  UIButton+animation.swift
//  Mool
//
//  Created by Alok Choudhary on 8/23/19.
//  Copyright © 2019 Mt Aden LLC. All rights reserved.
//

import Foundation
import UIKit

extension UIButton {
    open func pulse() {
        let bounce = CASpringAnimation(keyPath: "transform.scale")
        bounce.duration = 0.3
        bounce.fromValue = 0.95
        bounce.toValue = 1.2
        bounce.autoreverses = true
        bounce.repeatCount = 1
        bounce.initialVelocity = 0.5
        bounce.damping = 1.0
        
        layer.add(bounce, forKey: nil)
    }
    
    open func flash() {
        let flash = CABasicAnimation(keyPath: "opacity")
        flash.duration = 0.3
        flash.fromValue = 1
        flash.toValue = 0.1
        flash.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        flash.autoreverses = true
        flash.repeatCount = 2
        
        layer.add(flash, forKey: nil)
    }
    
    open func nopeShake() {
        let shake = CABasicAnimation(keyPath: "position")
        shake.duration = 0.1
        shake.repeatCount = 2
        shake.autoreverses = true
        
        let fromPoint = CGPoint(x: center.x - 5, y: center.y)
        let fromValue = NSValue(cgPoint: fromPoint)
        
        let toPoint = CGPoint(x: center.x + 5, y: center.y)
        let toValue = NSValue(cgPoint: toPoint)
        
        shake.fromValue = fromValue
        shake.toValue = toValue
        
        layer.add(shake, forKey: nil)
    }
    
    open func bounce() {
        let bounce = CABasicAnimation(keyPath: "position")
        bounce.duration = 0.1
        bounce.repeatCount = 2
        bounce.autoreverses = true
        
        let fromPoint = CGPoint(x: center.x, y: center.y - 5)
        let fromValue = NSValue(cgPoint: fromPoint)
        
        let toPoint = CGPoint(x: center.x, y: center.y)
        let toValue = NSValue(cgPoint: toPoint)
        
        bounce.fromValue = fromValue
        bounce.toValue = toValue
        
        layer.add(bounce, forKey: nil)
    }
}

