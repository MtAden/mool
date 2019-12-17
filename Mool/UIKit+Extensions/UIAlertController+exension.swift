//
//  UIAlertController+exension.swift
//  Mool
//
//  Created by Alok Choudhary on 12/15/19.
//  Copyright © 2019 Mt Aden LLC. All rights reserved.
//

import Foundation

#if canImport(UIKit)
extension UIAlertController {
  // creates an alert controller with a password text field
  static func passwordDialogue(title: String, message: String, handler: @escaping (String?) -> Void) -> UIAlertController {
    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
    alert.addTextField { field in
      field.isSecureTextEntry = true
    }
    alert.addAction(UIAlertAction(title: "Enter", style: .default, handler: {_ in
      handler(alert.textFields?.first?.text)
    }))
    return alert
  }
}

#endif
