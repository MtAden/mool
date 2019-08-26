//
//  String+localization.swift
//  Mool
//
//  Created by Alok Choudhary on 8/25/19.
//  Copyright © 2019 Mt Aden LLC. All rights reserved.
//

import Foundation

extension String {
    var localizable: String {
        return NSLocalizedString(self, comment: "")
    }
}
