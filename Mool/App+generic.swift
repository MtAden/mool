//
//  App+generic.swift
//  Mool
//
//  Created by Alok Choudhary on 9/21/19.
//  Copyright © 2019 Mt Aden LLC. All rights reserved.
//

import Foundation


/// AppInfo: is enum that has static vars that provide version related infomation
public enum AppInfo {

    /**
     returns the short version number like `1.0.1`.
     ### Usage: ###
     ```
     AppInfo.shortVersion
     ```
     */
    public static let shortVersion = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String ?? ""
    
    /**
     returns the build version number like `23`.
     - Parameters:
        - none
     ### Usage: ###
     ````
     AppInfo.bundleVersion
     ````
     */

    public static let bundleVersion = Bundle.main.object(forInfoDictionaryKey: kCFBundleVersionKey as String) as? String ?? ""
    
    /**
     return complete string of version and build number in format like `1.0.1(23)`.

     - Parameters:

        - None : NA.

     ### Usage: ###

     ````
     AppInfo.versionBuild
     ````
     */
    public static let versionBuild: String = "Version \(shortVersion)(build \(bundleVersion))"
}


