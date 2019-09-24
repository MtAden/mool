//
//  UIActivity+Extension.swift
//  UKExtensions
//
//  Created by Alok Choudhary on 1/15/19.
//  Copyright © 2019 Alok Choudhary. All rights reserved.
//

#if canImport(UIKit) && os(iOS)
import UIKit

// MARK: - ActivityType
public extension UIActivity.ActivityType {
    
    /// UKExtensions: AddToiCloudDrive
    static let addToiCloudDrive = UIActivity.ActivityType("com.apple.CloudDocsUI.AddToiCloudDrive")
    
    /// UKExtensions: WhatsApp share extension
    static let postToWhatsApp = UIActivity.ActivityType("net.whatsapp.WhatsApp.ShareExtension")
    
    /// UKExtensions: LinkedIn share extension
    static let postToLinkedIn = UIActivity.ActivityType("com.linkedin.LinkedIn.ShareExtension")
    
    /// UKExtensions: XING share extension
    static let postToXing = UIActivity.ActivityType("com.xing.XING.Xing-Share")
    
}
#endif
