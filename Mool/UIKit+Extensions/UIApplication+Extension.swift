//
//  UIApplication+Extension.swift
//
//  Created by Alok Choudhary on 2/7/19.
//  Copyright © 2019 Alok Choudhary. All rights reserved.
//

#if canImport(UIKit) && os(iOS)
import UIKit
extension UIApplication {
    var statusBarView: UIView? {
        return value(forKey: "statusBar") as? UIView
    }

    func showIndicatorOnStausBar() {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }

    func hideIndicatorOnStatusBar() {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }

    static func networkActivityIndicatorStatusBar(show visible: Bool) {
        if visible {
            UIApplication.shared.showIndicatorOnStausBar()
        } else {
            UIApplication.shared.hideIndicatorOnStatusBar()
        }
    }
}

extension UIApplication {
    @discardableResult
    static func presentAlert(title: String, message: String, buttonTitles: [String] = ["OK"], completion: ((UIAlertAction) -> Void)? = nil) -> UIAlertController? {
        return self.shared.keyWindow?.rootViewController?.presentAlert(title: title, message: message, buttonTitles: buttonTitles, completion: completion)
    }
    
    static func presentError(_ error: Error?) {
        self.shared.keyWindow?.rootViewController?.presentError(error)
    }
    
    static func presentInfo(_ message: String) {
        self.shared.keyWindow?.rootViewController?.presentInfo(message)
    }
}
#endif
