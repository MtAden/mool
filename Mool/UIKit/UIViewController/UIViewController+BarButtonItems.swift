//
//  UIViewController+BarButtonItems.swift
//  Mool
//
//  Created by Alok Choudhary on 8/25/19.
//  Copyright © 2019 Mt Aden LLC. All rights reserved.
//

import UIKit

private let kCustomBarItemWidth: CGFloat = 32

extension UIViewController {
    
    func addBackButtonIfNeeded() {
        if let navigationController = navigationController, navigationController.viewControllers.first != self {
            navigationItem.leftBarButtonItem = backButton()
        }
    }
    
    func addCloseButton() {
        navigationItem.rightBarButtonItem = closeButton()
    }
    
    private func backButton() -> UIBarButtonItem {
        return UIBarButtonItem(image: #imageLiteral(resourceName: "arrow_left"), style: .plain, target: self, action: #selector(self.backButtonDidPress))
    }
    
    private func closeButton() -> UIBarButtonItem {
        return UIBarButtonItem(image: #imageLiteral(resourceName: "cross"), style: .plain, target: self, action: #selector(self.closeButtonDidPress))
    }
    
    // MARK: - Actions
    
    @objc func backButtonDidPress() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc private func closeButtonDidPress() {
        dismiss(animated: true)
    }
}

