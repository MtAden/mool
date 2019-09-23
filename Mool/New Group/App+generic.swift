//
//  App+generic.swift
//  Mool
//
//  Created by Alok Choudhary on 9/21/19.
//  Copyright © 2019 Mt Aden LLC. All rights reserved.
//

import Foundation

public enum AppInfo {
    public static let shortVersion = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String ?? ""
    public static let bundleVersion = Bundle.main.object(forInfoDictionaryKey: kCFBundleVersionKey as String) as? String ?? ""
    public static let versionBuild: String = "Version \(shortVersion)(build \(bundleVersion))"
}
