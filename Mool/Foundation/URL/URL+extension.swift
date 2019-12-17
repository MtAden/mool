//
//  URL+extension.swift
//  Mool
//
//  Created by Alok Choudhary on 12/15/19.
//  Copyright © 2019 Mt Aden LLC. All rights reserved.
//

import Foundation


extension URL {
  // returns an absolute URL to the desired file in documents folder
  static func inDocumentsFolder(fileName: String) -> URL {
    return URL(fileURLWithPath: NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0], isDirectory: true)
      .appendingPathComponent(fileName)
  }
}
