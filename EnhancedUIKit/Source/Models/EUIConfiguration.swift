//
//  EUIConfiguration.swift
//  EnhancedUIKit
//
//  Created by Burak Uzunboy on 15.06.2018.
//  Copyright © 2018 EUIKit. All rights reserved.
//

import UIKit

public class EUIConfiguration: NSObject {
    
    @objc public static let sharedInstance = EUIConfiguration()
    
    // Public Properties
    
    /**
     * Sets log level for the log interface.
     *
     * Default is info level.
     */
    public var LogLevel: logLevel = .Info {
        didSet {
            EUIKit.LogInterface.log(withLevel: self.LogLevel, "Log Level is changed from \(oldValue) to \(self.LogLevel)")
        }
    }
    
    /**
     * If sets true, saves all logs to .log file with the **logFileName** property.
     *
     * Default is false.
     */
    public var shouldSaveLogs: Bool = false {
        didSet {
            if self.shouldSaveLogs {
                EUIKit.LogInterface.log(withLevel: .Info, "Logs will be saved to file with name: \(self.logFileName)")
            } else {
                EUIKit.LogInterface.log(withLevel: .Info, "Logs won't be saved to file")
            }
        }
    }
    
    /**
     * Changes log file name.
     *
     * In order to save logs **shouldSaveLogs** must be set true.
     *
     * Default is *LogFile*.
     */
    public var logFileName: String = "LogFile" {
        didSet {
            EUIKit.LogInterface.log(withLevel: .Info, "Log file name is changed to: \(self.logFileName)")
        }
    }
    
    /**
     * Sets the maximum limit of the log file size.
     *
     * When size exceeds the limit, all logs will be removed from the file and reinitialized.
     *
     * Default is *30 MB*.
     */
    public var maximumLogFileSize: CGFloat = 30 {
        didSet {
            EUIKit.LogInterface.log(withLevel: .Info, "Log file limit is set to \(self.maximumLogFileSize) MB")
        }
    }
    
    // Private Propertiesxw
    
    private override init() {
        super.init()
    }
    
    // Internal Properties
    internal var isLogInterfaceStarted: Bool = false
    
}
