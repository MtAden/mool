//
//  String+EmailValidation.swift
//  Mool
//
//  Created by Alok Choudhary on 6/25/20.
//  Copyright © 2020 Mt Aden LLC. All rights reserved.
//

import Foundation

extension String {

    func isValidEmailAddress() throws ->  Bool {
        var isValidEmailAddressRegex: NSRegularExpression? = nil
        do {
            isValidEmailAddressRegex = try NSRegularExpression(pattern: "^[a-zA-Z0-9\\._%+\\-]+@[a-zA-Z0-9\\-]+(\\.[a-zA-Z0-9\\-]+)*$", options: [])
        } catch let error {
            throw error
        }

        return nil != isValidEmailAddressRegex?.firstMatch(in: self, options: [], range: NSRange(location: 0, length: count))
    }
}
