//
//  Toolbar+helpers.swift
//  Mool
//
//  Created by Alok Choudhary on 9/19/19.
//  Copyright © 2019 Mt Aden LLC. All rights reserved.
//

import UIKit

struct UIKitHelper {
    private init() { }
    static func createToolBarWith(buttonTitle: String, action: Selector) -> UIToolbar {
        let toolBar = UIToolbar()
        toolBar.barStyle = .default
        toolBar.isTranslucent = true
        toolBar.tintColor = UIWindow().tintColor
        toolBar.sizeToFit()
        
        // Adding Button ToolBar
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: action)
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        toolBar.setItems([spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        return toolBar
    }
    
    static func createToolBarWith(buttons titles: [String], actions: [Selector]) -> UIToolbar {
        let toolBar = UIToolbar()
        toolBar.barStyle = .default
        toolBar.isTranslucent = true
        toolBar.tintColor = UIWindow().tintColor
        toolBar.sizeToFit()
        
        var allButtons = [UIBarButtonItem]()
        
        //TOOD: get index fix so that no black selector is inserted for space
        //var correctedIndex = 0
        for (index, title) in titles.enumerated() {
            var button = UIBarButtonItem()
            if title.capitalized == "space".capitalized {
                button = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
            } else {
                button = UIBarButtonItem(title: title.capitalized, style: .plain, target: self, action: actions[index])
            }
            
            allButtons.append(button)
        }
        
        toolBar.setItems(allButtons, animated: false)
        toolBar.isUserInteractionEnabled = true
        return toolBar
    }
}
