//
//  LAContext+extension.swift
//  Mool
//
//  Created by Alok Choudhary on 1/8/20.
//  Copyright © 2020 Mt Aden LLC. All rights reserved.
//

import LocalAuthentication

extension LAContext {
    enum BiometricType: String {
        case none
        case touchID
        case faceID
    }

    var biometricType: BiometricType {
        var error: NSError?

        guard self.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) else {
            // Capture these recoverable error thru Crashlytics
            return .none
        }

        if #available(iOS 11.0, *) {
            switch self.biometryType {
            case .none:
                return .none
            case .touchID:
                return .touchID
            case .faceID:
                return .faceID
            @unknown default:
                fatalError()
            }
        } else {
            return  self.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: nil) ? .touchID : .none
        }
    }
    
    static public func validateUserWithBioIdIfPossible(_ reasonText: String, completion: @escaping (_ success: Bool) -> Void) {
        let context = LAContext()
        let error = NSErrorPointer.init(nilLiteral: ())
        let policy: LAPolicy
        if #available(iOS 8, *) {
            policy = .deviceOwnerAuthenticationWithBiometrics
        } else {
            policy = .deviceOwnerAuthentication
        }
        if context.canEvaluatePolicy(policy, error: error) {
            context.evaluatePolicy(policy, localizedReason: reasonText, reply: { (success, _) -> Void in
                completion(success)
            })
        } else {
            completion(false)
        }
    }
}
