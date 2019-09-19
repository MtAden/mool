//
//  UIView+autolayout.swift
//  Mool
//
//  Created by Alok Choudhary on 9/19/19.
//  Copyright © 2019 Mt Aden LLC. All rights reserved.
//

import UIKit

extension UIView {
    func anchorToSuperview(edgeInset: UIEdgeInsets = .zero) {
        guard let superview = self.superview else { return }
        self.topAnchor.constraint(equalTo: superview.topAnchor, constant: edgeInset.top).isActive = true
        self.leftAnchor.constraint(equalTo: superview.leftAnchor, constant: edgeInset.left).isActive = true
        self.bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: edgeInset.bottom).isActive = true
        self.rightAnchor.constraint(equalTo: superview.rightAnchor, constant: edgeInset.right).isActive = true
    }
    
    @available(iOS 11, *)
    func anchorToSuperviewSafeArea() {
        guard let superview = self.superview else { return }
        self.topAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.topAnchor, constant: self.safeAreaInsets.top).isActive = true
        self.leftAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.leftAnchor, constant: self.safeAreaInsets.left).isActive = true
        self.bottomAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.bottomAnchor, constant: self.safeAreaInsets.bottom).isActive = true
        self.rightAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.rightAnchor, constant: self.safeAreaInsets.right).isActive = true
    }
    
    func anchor(to view: UIView, edgeInset: UIEdgeInsets = .zero) {
        self.topAnchor.constraint(equalTo: view.topAnchor, constant: edgeInset.top).isActive = true
        self.leftAnchor.constraint(equalTo: view.leftAnchor, constant: edgeInset.left).isActive = true
        self.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: edgeInset.bottom).isActive = true
        self.rightAnchor.constraint(equalTo: view.rightAnchor, constant: edgeInset.right).isActive = true
    }
    
    func anchor(centerTo view: UIView, offset: CGPoint = .zero) {
        self.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: offset.x).isActive = true
        self.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: offset.y).isActive = true
    }
}

