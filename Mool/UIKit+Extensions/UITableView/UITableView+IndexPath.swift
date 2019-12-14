//
//  UITableView+IndexPath.swift
//  Mool
//
//  Created by Alok Choudhary on 12/14/19.
//  Copyright © 2019 Mt Aden LLC. All rights reserved.
//

import UIKit

extension IndexPath {
  static func fromRow(_ row: Int) -> IndexPath {
    return IndexPath(row: row, section: 0)
  }
}
