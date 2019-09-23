//
//  UIViewConroller+Hero.swift
//  eBolt
//
//  Created by Alok Choudhary on 7/9/18.
//  Copyright © 2018 Alok Choudhary. All rights reserved.
//

#if canImport(UIKit) && canImport(Hero) && os(iOS)
import UIKit
import Hero

public extension UIViewController {
    func setupHero() {
        hero.isEnabled = true
        view.hero.modifiers = [.useLayerRenderSnapshot]
    }
}

#endif
