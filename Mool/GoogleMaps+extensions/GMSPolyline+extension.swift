//
//  GMSPolyline+extension.swift
//  Mool
//
//  Created by Alok Choudhary on 9/19/19.
//  Copyright © 2019 Mt Aden LLC. All rights reserved.
//

#if canImport(GoogleMaps) && os(iOS)
import GoogleMaps

extension GMSPolyline {
    func colorized(isPickupRoute: Bool) {
        if isPickupRoute {
            strokeWidth = 2
            strokeColor = UIColor.PrimaryPalette.blue
        } else {
            strokeWidth = 1
            strokeColor = UIColor.SecondaryPalette.gray
        }
    }
}

#endif
