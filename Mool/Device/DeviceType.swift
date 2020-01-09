//
//  DeviceType.swift
//  Mool
//
//  Created by Alok Choudhary on 9/25/19.
//  Copyright © 2019 Mt Aden LLC. All rights reserved.
//


public enum Type: String {
    #if os(iOS)
    case iPhone
    case iPad
    case iPod
    case simulator
    #elseif os(OSX)
    case iMac
    case macMini
    case macPro
    case macBook
    case macBookAir
    case macBookPro
    case xserve
    #endif
    case unknown
}
