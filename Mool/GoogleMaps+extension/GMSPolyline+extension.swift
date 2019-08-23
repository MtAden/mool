//
//  GMSPolyline+extension.swift
//  Mool
//
//  Created by Alok Choudhary on 2/21/19.
//

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
