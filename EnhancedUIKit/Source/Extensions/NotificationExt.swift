//
//  NotificationExt.swift
//  EnhancedUIKit
//
//  Created by Burak Uzunboy on 16.06.2018.
//  Copyright © 2018 EUIKit. All rights reserved.
//

import Foundation

extension Notification.Name {
 
    static let applicationWillResignActive = Notification.Name(applicationStates.applicationWillResignActive.rawValue)
    static let applicationDidBecomeActive = Notification.Name(applicationStates.applicationDidBecomeActive.rawValue)
    static let applicationWillEnterForeGround = Notification.Name(applicationStates.applicationWillEnterForeGround.rawValue)
    static let applicationWillEnterBackground = Notification.Name(applicationStates.applicationWillEnterBackground.rawValue)
    static let applicationWillTerminate = Notification.Name(applicationStates.applicationWillTerminate.rawValue)

}
