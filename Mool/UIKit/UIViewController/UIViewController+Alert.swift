//
//  UIViewController+Alert.swift
//  Mool
//
//  Created by Alok Choudhary on 8/25/19.
//  Copyright © 2019 Mt Aden LLC. All rights reserved.
//

import UIKit

private let quantityCountMax = 3

extension UIViewController {
    func showQuantityAlert(with quantity: Int, doneActionHandler: @escaping (_ text: String) -> Void) {
        let title = "Alert.Quantity".localizable
        let message = "Alert.EnterQuantity".localizable.uppercased()
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alertController.addTextField { textField in
            textField.keyboardType = .numberPad
            textField.text = String(quantity)
            textField.addTarget(alertController, action: #selector(alertController.textDidChange), for: .editingChanged)
        }
        
        let doneAction = UIAlertAction(title: "Button.Done".localizable, style: .default) { _ in
            guard let text = alertController.textFields?.first?.text else {
                return
            }
            doneActionHandler(text)
        }
        
        let cancelAction = UIAlertAction(title: "Button.Cancel".localizable, style: .cancel)
        
        alertController.addAction(doneAction)
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true)
    }
}

extension UIAlertController {
    @objc func textDidChange() {
        if let text = textFields?.first?.text, let action = actions.first {
            action.isEnabled = text.count <= quantityCountMax && !text.isEmpty
        }
    }
}

