//
//  UIStoryboard+extension.swift
//  UKExtensions
//
//  Created by Alok Choudhary on 3/5/19.
//  Copyright © 2019 Alok Choudhary. All rights reserved.
//

import UIKit

public extension UIStoryboard {
    
    static func viewController(from storyboard: UIStoryboard, with identifier: String, in bundle: Bundle? = nil) -> UIViewController {
        return UIViewController()
    }
    
    static func createViewController(with viewContorllerId: String, storyboardName: String, bundle: Bundle? = nil) -> UIViewController {
        let storyboard = UIStoryboard(name: storyboardName, bundle: bundle)
        let viewController = storyboard.instantiateViewController(withIdentifier: viewContorllerId)
        return viewController
        
    }
}

