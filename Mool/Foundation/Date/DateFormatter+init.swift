//
//  DateFormatter+init.swift
//  Mool
//
//  Created by Alok Choudhary on 12/15/19.
//  Copyright © 2019 Mt Aden LLC. All rights reserved.
//

import Foundation

extension DateFormatter {
  // sets the date and time style after init
  convenience init(dateStyle: DateFormatter.Style, timeStyle: DateFormatter.Style) {
    self.init()
    self.dateStyle = dateStyle
    self.timeStyle = timeStyle
  }
}
