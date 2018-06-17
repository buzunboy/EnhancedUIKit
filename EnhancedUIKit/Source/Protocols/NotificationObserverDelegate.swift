//
//  NotificationObserverDelegate.swift
//  EnhancedUIKit
//
//  Created by Burak Uzunboy on 16.06.2018.
//  Copyright © 2018 EUIKit. All rights reserved.
//

import Foundation

public protocol NotificationObserverDelegate: NSObjectProtocol {
    
    func didApplicationStateChanged(to state: applicationStates)
    
}
