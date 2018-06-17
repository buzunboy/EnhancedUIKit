//
//  EUIPropertyListEngine.swift
//  EnhancedUIKit
//
//  Created by Burak Uzunboy on 16.06.2018.
//  Copyright © 2018 EUIKit. All rights reserved.
//

import UIKit

extension EUIKit {
    
    /**
     * Creates .plist file in the device directory.
     * - important: PropertyList **(.plist)** file should be created in the project with the same list name.
     * - since: 1.0.0
     */
    public class PropertyListEngine: NSObject {
        
        private var listName: String!
        private var list: NSDictionary?
        
        /**
         * Creates .plist file in the device directory if isn't created before.
         * - important: PropertyList **(.plist)** file should be created in the project with the same list name before using.
         * - parameter listName: name of the Property List file.
         */
        public init(listName: String) {
            super.init()
            self.listName = listName
            self.list = self.loadProperties()
        }
        
        /**
         * Sets the value with the specified key in the device directory.
         * - parameter value: Any value.
         * - parameter key: Key for the value as string.
         */
        public func setValue(_ value: Any, for key: String) {
            let destPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
            let fullDestPath = NSURL(fileURLWithPath: destPath).appendingPathComponent("\(listName!).plist")
            let fullDestPathString = fullDestPath!.path
            
            if let dict = self.readPropertiesDictionary() {
                dict.setObject(value, forKey: key as NSCopying)
                dict.write(toFile: fullDestPathString, atomically: false)
            } else {
                EUIKit.LogInterface.log(withLevel: .Error, "Couldn't read \(self.listName!).plist")
            }
        }
        
        /**
         * Returns value of the specified key in the device directory.
         * - parameter key: Key for the value as string.
         * - returns: Returns of the value, if specified key or file isn't found returns nil.
         */
        public func getValue(for key: String) -> Any? {
            if let dict = self.list {
                return dict.value(forKey: key)
            } else {
                EUIKit.LogInterface.log(withLevel: .Error, "Couldn't read \(self.listName!).plist")
            }
            return nil
        }

        /**
         * Returns all list in the device directory.
         * If only one value is used, **getValue(for key:)** can be used.
         * - returns: List of the file as a NSDictionary
         */
        public func loadProperties() -> NSDictionary? {
            let path = openProperties()
            if path != nil {
                if let list = list {
                    return list
                } else {
                    if let propertyDict = NSDictionary(contentsOfFile: path!) {
                        self.list = propertyDict
                        return propertyDict
                    } else {
                        EUIKit.LogInterface.log(withLevel: .Error, "Couldn't load \(self.listName!).plist file")
                    }
                }
            }
            return nil
        }
        
        /**
         * Reloads list in the device directory.
         * After changes, this method should be called. Otherwise, all methods returns old values.
         */
        public func reloadList() {
            self.list = nil
            self.list = self.loadProperties()
        }
        
        /**
         * Removes list from the device directory.
         */
        public func removeListFromDevice() {
            let destPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
            let fileManager = FileManager.default
            let fullDestPath = NSURL(fileURLWithPath: destPath).appendingPathComponent("\(listName!).plist")
            let fullDestPathString = fullDestPath!.path
            if fileManager.fileExists(atPath: fullDestPathString) {
                do {
                    try fileManager.removeItem(atPath: fullDestPathString)
                } catch {
                    EUIKit.LogInterface.log(withLevel: .Error, "\(listName!).plist couldn't remove from the device directory - Error: \(error.localizedDescription)")
                }
            }
        }

        private func readPropertiesDictionary() -> NSMutableDictionary? {
            let destPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
            let fullDestPath = NSURL(fileURLWithPath: destPath).appendingPathComponent("\(listName!).plist")
            if fullDestPath != nil {
                let fullDestPathString = fullDestPath!.path
                return NSMutableDictionary(contentsOfFile: fullDestPathString)
            } else {
                return nil
            }
        }
        
        private func openProperties() -> String? {
            let bundlePath = Bundle.main.path(forResource: listName, ofType: ".plist")
            let destPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
            let fileManager = FileManager.default
            let fullDestPath = NSURL(fileURLWithPath: destPath).appendingPathComponent("\(listName!).plist")
            let fullDestPathString = fullDestPath!.path
            if fileManager.fileExists(atPath: fullDestPathString) {
                EUIKit.LogInterface.log(withLevel: .Info, "\(listName!).plist file is already found in device directory")
            } else {
                do {
                    try fileManager.copyItem(atPath: bundlePath!, toPath: fullDestPathString)
                } catch {
                    EUIKit.LogInterface.log(withLevel: .Error, "\(listName!).plist couldn't copy to the device directory - Error: \(error.localizedDescription)")
                }
            }
            return fullDestPathString
        }
    }
    
}
