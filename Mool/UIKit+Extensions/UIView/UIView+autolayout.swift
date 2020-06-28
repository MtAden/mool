//
//  UIView+autolayout.swift
//  Mool
//
//  Created by Alok Choudhary on 9/19/19.
//  Copyright © 2019 Mt Aden LLC. All rights reserved.
//
#if canImport(UIKit) && os(iOS)
import UIKit

extension UIView {
    
    /// Anchor view to it's super view
    /// - Parameter edgeInset: setting inset edges for view in superview. default value is `.zero`.
    func anchorToSuperview(edgeInset: UIEdgeInsets = .zero) {
        guard let superview = self.superview else { return }
        self.topAnchor.constraint(equalTo: superview.topAnchor, constant: edgeInset.top).isActive = true
        self.leftAnchor.constraint(equalTo: superview.leftAnchor, constant: edgeInset.left).isActive = true
        self.bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: edgeInset.bottom).isActive = true
        self.rightAnchor.constraint(equalTo: superview.rightAnchor, constant: edgeInset.right).isActive = true
    }
    
    
    /// Anchor view to super view's safe area
    @available(iOS 11, *) func anchorToSuperviewSafeArea() {
        guard let superview = self.superview else { return }
        self.topAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.topAnchor, constant: self.safeAreaInsets.top).isActive = true
        self.leftAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.leftAnchor, constant: self.safeAreaInsets.left).isActive = true
        self.bottomAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.bottomAnchor, constant: self.safeAreaInsets.bottom).isActive = true
        self.rightAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.rightAnchor, constant: self.safeAreaInsets.right).isActive = true
    }
    
    
    /// Anchor view to another view with edgeInsets
    /// - Parameters:
    ///   - view: destination view
    ///   - edgeInset: edgeInset, default is `.zero`
    func anchor(to view: UIView, edgeInset: UIEdgeInsets = .zero) {
        self.topAnchor.constraint(equalTo: view.topAnchor, constant: edgeInset.top).isActive = true
        self.leftAnchor.constraint(equalTo: view.leftAnchor, constant: edgeInset.left).isActive = true
        self.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: edgeInset.bottom).isActive = true
        self.rightAnchor.constraint(equalTo: view.rightAnchor, constant: edgeInset.right).isActive = true
    }
    
    
    /// Anchor current view centered to destination view.
    /// - Parameters:
    ///   - view: Destination/other View
    ///   - offset: Offset from cetner. Default is `.zero`
    func anchor(centerTo view: UIView, offset: CGPoint = .zero) {
        self.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: offset.x).isActive = true
        self.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: offset.y).isActive = true
    }
}
#endif
