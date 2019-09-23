//
//  UIColor+Extension.swift
//  Mool
//
//  Created by Alok Choudhary on 1/7/19.
//  Copyright © 2019 Alok Choudhary. All rights reserved.
//

import Foundation
public extension UIColor {
    static func getComplementaryForColor(color: UIColor) -> UIColor {
        
        let ciColor = CIColor(color: color)
        
        // get the current values and make the difference from white:
        let compRed: CGFloat = 1.0 - ciColor.red
        let compGreen: CGFloat = 1.0 - ciColor.green
        let compBlue: CGFloat = 1.0 - ciColor.blue
        
        return UIColor(red: compRed, green: compGreen, blue: compBlue, alpha: 1.0)
    }
    
    static func color(withImageName name: String) -> UIColor {
        return UIColor.init(hexString: "E8BA74")
        //UIKIT bug that crashes when patternImage is used //Issue #14
        //Wait till this bug is resolved
        //guard let image = UIImage(named: name) else { return UIColor.clear }
        //return UIColor.init(patternImage: image)
    }
}
