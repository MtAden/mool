//
//  String+extension.swift
//  Mool
//
//  Created by Alok Choudhary on 2/26/19.
//  Copyright © 2019 Alok Choudhary. All rights reserved.
//

import Foundation
import UIKit

extension String {
    func height(withConstrainedWidth width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
        
        return ceil(boundingBox.height)
    }
    
    func width(withConstrainedHeight height: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: .greatestFiniteMagnitude, height: height)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
        
        return ceil(boundingBox.width)
    }
}

extension String {
    public func removeWhiteSpaces() -> String {
        let arr = self.components(separatedBy: CharacterSet(charactersIn: " "))
        var concatedString = ""
        
        for word in arr {
            concatedString = concatedString + word
        }
        
        return concatedString
    }
}
