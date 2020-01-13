//
//  LAContext+extension.swift
//  Mool
//
//  Created by Alok Choudhary on 1/8/20.
//  Copyright © 2020 Mt Aden LLC. All rights reserved.
//

import LocalAuthentication

public extension LAContext {
    enum BiometricType: String {
        case none
        case touchID
        case faceID
    }

    static func currentBiometricType() -> BiometricType {
        var error: NSError?
        let authContext = LAContext()
        
        if #available(iOS 11.0, *) {
        let _ =  authContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error)

            switch authContext.biometryType {
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
            return  authContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: nil) ? .touchID : .none
        }
    }
    
    static func validateUserWithBioIdIfPossible(_ reasonText: String, completion: @escaping (_ success: Bool) -> Void) {
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
    
    @available(iOS 11.0, *)
    static func correctImageForBioMetric() -> UIImage? {
        if LAContext.currentBiometricType() == .faceID {
            return UIImage(named: "face_id")
        } else {
            return  UIImage(named: "touch_id")

        }
    }
}
