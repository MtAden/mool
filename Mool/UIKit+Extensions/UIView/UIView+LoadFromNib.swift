//
//  UIView+LoadFromNib.swift
//  Mool
//
//  Created by Alok Choudhary on 8/25/19.
//  Copyright © 2019 Mt Aden LLC. All rights reserved.
//

#if canImport(UIKit) && os(iOS)

import UIKit

extension UIView {
    func loadFromNib(with nibName: String? = nil) {
        let view = Bundle.main.loadNibNamed(nibName ?? nameOfClass, owner: self)?.last as! UIView
        addSubview(view)
        
        view.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        view.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
        view.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
        view.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
        view.translatesAutoresizingMaskIntoConstraints = false
    }
}

#endif
