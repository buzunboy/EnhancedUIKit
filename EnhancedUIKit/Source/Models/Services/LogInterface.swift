//
//  EUILogInterface.swift
//  EnhancedUIKit
//
//  Created by Burak Uzunboy on 15.06.2018.
//  Copyright © 2018 EUIKit. All rights reserved.
//

import UIKit

extension EUIKit {
    
    /**
     * Logs messages with their levels and saves to file if wanted.
     * - important: Log file **(.log)** should be created in the project with the same name specified in **EUIConfiguration** with *logFileName* if *shouldSaveLogs* configuration is set to true.
     * - since: 1.0.0
     */
    public class LogInterface: NSObject {
        
        /**
         * Logs the message and if configured saves to file.
         *
         * In order to save logs **shouldSaveLogs** must be set true.
         *
         * - parameter withLevel: Log level for the message
         * - parameter format: Message as a string or formatted string
         * - parameter file: **Do not change** Takes file name as a default
         * - parameter function: **Do not change** Takes function name as a default
         * - parameter line: **Do not change** Takes line of the log as a default
         * - parameter args: If formatted string used args should be specified.
         */
        class public func log(withLevel: logLevel,_ format: String, file: String = #file, function: String = #function, line: Int = #line, _ args: CVarArg...) {
            if withLevel.rawValue >= EUIConfiguration.sharedInstance.LogLevel.rawValue {
                createLog(type: withLevel, file: file, function: function, line: line, format, args)
            }
        }
        
        /**
         * Returns all logs saved to file in the device directory.
         *
         * Can be used while sending as attachment to mail etc.
         */
        class public func getLogFile() -> NSString? {
            self.log(withLevel: .Info, "Log file is gathering")
            return readLogFile()
        }
        
        /**
         * Starts logs to write into file with the specified name in the **EUIConfiguration**.
         */
        public func start() {
            EUIConfiguration.sharedInstance.isLogInterfaceStarted = true
        }
        
        /**
         * Stops logs to write into file.
         */
        public func stop() {
            EUIConfiguration.sharedInstance.isLogInterfaceStarted = false
        }        
    }
    
}

private func createLog(type: logLevel, file: String, function: String, line: Int, _ format: String, _ args: CVarArg...) {
    NSLog(format, args)
    if EUIConfiguration.sharedInstance.isLogInterfaceStarted && EUIConfiguration.sharedInstance.shouldSaveLogs {
        let destPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let fullDestPath = NSURL(fileURLWithPath: destPath).appendingPathComponent("\(EUIConfiguration.sharedInstance.logFileName).log")
        let fullDestPathString = fullDestPath!.path
        
        var fileString = readLogFile()
        if fileString != nil {
            let dateFormatOfToday = DateFormatter()
            dateFormatOfToday.dateFormat = "MM/dd/yy @ HH:mm:ss.SSSS"
            let date = dateFormatOfToday.string(from: Date())
            if type == .Info {
                fileString = fileString?.appendingFormat("\n >> INFO >> ")
            } else if type == .Error {
                fileString = fileString?.appendingFormat("\n >> ERROR >> ")
            } else if type == .Verbose {
                fileString = fileString?.appendingFormat("\n >> VERBOSE LOG >> ")
            } else if type == .Warning {
                fileString = fileString?.appendingFormat("\n >> WARNING >> ")
            }
            fileString = fileString?.appendingFormat("[\(date)]: [FUNCTION: \(function) AT \(file).\(line)] \(format)" as NSString, args)
            do {
                try fileString?.write(toFile: fullDestPathString, atomically: false, encoding: String.Encoding.utf8.rawValue)
            } catch {
                NSLog("Couldn't write to \(EUIConfiguration.sharedInstance.logFileName).logs - Error: \(error.localizedDescription)")
            }
        } else {
            NSLog("Couldn't read \(EUIConfiguration.sharedInstance.logFileName).log")
        }
    }
}

private func readLogFile() -> NSString? {
    let destPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
    let fullDestPath = NSURL(fileURLWithPath: destPath).appendingPathComponent("\(EUIConfiguration.sharedInstance.logFileName).log")
    if fullDestPath != nil {
        let fullDestPathString = fullDestPath!.path
        do {
            return try NSString(contentsOfFile: fullDestPathString, encoding: String.Encoding.utf8.rawValue)
        } catch {
            NSLog("Couldn't read \(EUIConfiguration.sharedInstance.logFileName).log - Error: \(error.localizedDescription)")
            return nil
        }
    } else {
        return nil
    }
}

class EUILogHandler {
    
    init(logLevel with: logLevel) {
        loadLogFile()
        EUIKit.LogInterface.log(withLevel: .Info, "Logging interface is initiated with level: \(with)")
    }
    
    private func loadLogFile() {
        let path = openLogFile()
        if path != nil {
            if let data = returnLogData() {
                let size = Float(data.length)/1048576
                EUIKit.LogInterface.log(withLevel: .Info, "File size of the \(EUIConfiguration.sharedInstance.logFileName).log file is: \(size) MB")
                if size > Float(EUIConfiguration.sharedInstance.maximumLogFileSize) {
                    self.removeAllLogs()
                    EUIKit.LogInterface.log(withLevel: .Info, "File size exceeded \(EUIConfiguration.sharedInstance.maximumLogFileSize) MB Limit - Removed all content")
                }
            }
        } else {
            NSLog("Couldn't load \(EUIConfiguration.sharedInstance.logFileName).log file")
        }
    }
    
    private func openLogFile() -> String? {
        let bundlePath = Bundle.main.path(forResource: EUIConfiguration.sharedInstance.logFileName, ofType: ".log")
        let destPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let fileManager = FileManager.default
        let fullDestPath = NSURL(fileURLWithPath: destPath).appendingPathComponent("\(EUIConfiguration.sharedInstance.logFileName).log")
        let fullDestPathString = fullDestPath!.path
        if fileManager.fileExists(atPath: fullDestPathString) {
            NSLog("\(EUIConfiguration.sharedInstance.logFileName).log file is already found in device directory")
        } else {
            do {
                try fileManager.copyItem(atPath: bundlePath!, toPath: fullDestPathString)
            } catch {
                NSLog("\(EUIConfiguration.sharedInstance.logFileName).log couldn't copy to the device directory - Error: \(error.localizedDescription)")
            }
        }
        return fullDestPathString
    }
    
    func returnLogData() -> NSData? {
        let destPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let fullDestPath = NSURL(fileURLWithPath: destPath).appendingPathComponent("\(EUIConfiguration.sharedInstance.logFileName).log")
        if fullDestPath != nil {
            let fullDestPathString = fullDestPath!.path
            return NSData(contentsOfFile: fullDestPathString)
        } else {
            return nil
        }
    }
    
    private func removeAllLogs() {
        let destPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let fullDestPath = NSURL(fileURLWithPath: destPath).appendingPathComponent("\(EUIConfiguration.sharedInstance.logFileName).log")
        let fullDestPathString = fullDestPath!.path
        
        let emptyString = NSString()
        do {
            try emptyString.write(toFile: fullDestPathString, atomically: false, encoding: String.Encoding.utf8.rawValue)
        } catch {
            NSLog("Couldn't delete logs from \(EUIConfiguration.sharedInstance.logFileName).logs - Error: \(error.localizedDescription)")
        }
    }
}



