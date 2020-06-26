//
//  UIViewController+extension.swift
//  UKExtensions
//
//  Created by Alok Choudhary on 2/28/19.
//  Copyright © 2019 Alok Choudhary. All rights reserved.
//

import UIKit
import UserNotifications

/// UKExtensions: This would dehide all back button text in project
extension UIViewController {
    open override func awakeFromNib() {
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
}

extension UIViewController {
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let okTittle = "Ok"
        alert.addAction(UIAlertAction(title: okTittle, style: UIAlertAction.Style.cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

extension UIViewController {
    func checkRemoteNotficationsPermission() {
        let notificationCenter = UNUserNotificationCenter.current()
        notificationCenter.getNotificationSettings { settings in
            debugPrint(settings)
            switch settings.authorizationStatus {
            case .notDetermined, .denied:
                debugPrint("Permission problem :(")
                DispatchQueue.main.async {
                    self.showNotificationsDisableAlert()
                }
            case .provisional:
                // provisional is the case where user doesn't give permission
                // to any time of notification inclusing lock screen,
                // notificaiton center and banner
                // This would need special kind of instruction.
                DispatchQueue.main.async {
                    self.showNotificationsDisableAlert()
                }
            case .authorized:
                debugPrint("All permissions good.")
            @unknown default:
                fatalError("Unknown case")
            }
        }
    }
    
    private func showNotificationsDisableAlert() {
        let message = """
          1. Go to settings
          2. Tap Notifications
          3. Set 'Allow Notifications' to On
        """
        let alertController = UIAlertController(title: "Notifications Permission", message: message, preferredStyle: .alert)
        let settingAction = UIAlertAction(title: "Open Settings", style: .default) { _ in
            if let appSettings = URL(string: UIApplication.openSettingsURLString) {
                UIApplication.shared.open(appSettings, options: convertToUIApplicationOpenExternalURLOptionsKeyDictionary([:]), completionHandler: nil)
            }
        }
        
        alertController.addAction(settingAction)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .default, handler: nil)
        alertController.addAction(cancelAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
}

//TODO: merge this to actual func
// Helper function inserted by Swift 4.2 migrator.
private func convertToUIApplicationOpenExternalURLOptionsKeyDictionary(_ input: [String: Any]) -> [UIApplication.OpenExternalURLOptionsKey: Any] {
    return Dictionary(uniqueKeysWithValues: input.map { key, value in (UIApplication.OpenExternalURLOptionsKey(rawValue: key), value) })
}

extension UIViewController {
    func showIndicator() -> UIActivityIndicatorView {
        let spinner = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 40, height:40))
        spinner.color = UIColor.gray
        spinner.center = CGPoint(x:UIScreen.main.bounds.size.width / 2, y:UIScreen.main.bounds.size.height / 2)
        self.view.window?.addSubview(spinner)
        spinner.hidesWhenStopped = true
        return spinner
    }
}
