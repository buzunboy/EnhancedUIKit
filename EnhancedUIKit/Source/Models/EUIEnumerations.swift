//
//  EUIEnumerations.swift
//  EnhancedUIKit
//
//  Created by Burak Uzunboy on 15.06.2018.
//  Copyright © 2018 EUIKit. All rights reserved.
//

import UIKit

public enum logLevel: Int {
    case Verbose = 0
    case Info = 1
    case Warning = 2
    case Error = 3
}

enum requestHTTPType: String {
    case post = "POST"
    case get = "GET"
    case put = "PUT"
    case patch = "PATCH"
    case delete = "DELETE"
}

public enum extendedErrorCodes: Int {
    case jsonError
    case taskError
    case urlConvertionError
}

public enum extendedErrorDomains: String {
    case EUIKitDomain = "EUIKitDomain"
}

public enum applicationStates: String {
    case applicationWillResignActive = "applicationWillResignActive"
    case applicationDidBecomeActive = "applicationDidBecomeActive"
    case applicationWillEnterForeGround = "applicationWillEnterForeGround"
    case applicationWillEnterBackground = "applicationWillEnterBackground"
    case applicationWillTerminate = "applicationWillTerminate"
}
