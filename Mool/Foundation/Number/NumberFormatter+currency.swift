//
//  NumberFormatter+currency.swift
//  Mool
//
//  Created by Alok Choudhary on 8/25/19.
//  Copyright © 2019 Mt Aden LLC. All rights reserved.
//

import Foundation

extension NumberFormatter {
    static func formatter(with currencyCode: String) -> NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = NumberFormatter.Style.currency
        formatter.currencyCode = currencyCode
        
        return formatter
    }
}
