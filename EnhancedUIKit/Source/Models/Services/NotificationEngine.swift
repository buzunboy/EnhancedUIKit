// This code is distributed under the terms and conditions of the MIT license.
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

import UIKit

extension EUIKit {
    
    public class NotificationEngine: NSObject {
        
        // MARK: - Public Properties
        
        /**
         * Returns Notification Engine instance.
         */
        public static let current = NotificationEngine()
        
        /**
         * Returns delegates of the Notification Engine.
         */
        public private(set) var delegates = [NotificationObserverDelegate]()
        
        /**
         * If sets true, publishes app state changes to delegates.
         */
        public var shouldAddStateObservers = true {
            didSet {
                if oldValue != self.shouldAddStateObservers {
                    self.addAppStateObservers(shouldAdd: self.shouldAddStateObservers)
                }
            }
        }
        
        // MARK: - Private Properties
        
        private var shouldCallDelegates = false
        
        // MARK: - Public Methods
        
        /**
         * Starts notification engine to publish messages to its delegates when notification is reached
         */
        public func start() {
            self.shouldCallDelegates = true
        }
        
        /**
         * Stops notification engine to publish messages.
         */
        public func stop() {
            self.shouldCallDelegates = false
        }
        
        /**
         * Adds observer to Notification Center.
         *
         * You can notify desired locations by using this method.
         *
         * - parameter withName: Specific name for the notification. Should be same when publishing message
         * - parameter willNotify: The selector which will be notified when message published
         * - parameter target: Target for the notification. Use **self** as default
         * - parameter object: The object to notify only specified observers. It can be passed nil, then all observers
         * with the same name will be notified
         */
        public func subscribe(withName: String, willNotify: Selector, target: Any, object: Any? = nil) {
            NotificationCenter.default.addObserver(target, selector: willNotify, name: Notification.Name(withName), object: object)
        }
        
        /**
         * Removes observer from the Notification Center.
         *
         * - parameter name: Name of the notification. Should be same while using the *subscribe(withName:willNotify:target:object)* method.
         * - parameter target: Target which will be desired from the unsubscribe.
         * - parameter object: The object if only specified object observer wanted to be unsubscribe. It can be passed nil, then unsubscribes all observers.
         */
        public func unsubscribe(name: String, target: Any, object: Any? = nil) {
            NotificationCenter.default.removeObserver(target, name: Notification.Name(name), object: object)
        }
        
        /**
         * Publishes message to observers and notifies them.
         *
         * - parameter withName: The observer name which desired to be notified
         */
        public func publishMessage(withName: String) {
            EUIKit.LogInterface.log(withLevel: .Info, "The notification is received with name: \(withName)")
            NotificationCenter.default.post(name: Notification.Name(withName), object: nil, userInfo: nil)
        }
        
        /**
         * Publishes message to observers and notifies them.
         *
         * - parameter withName: The observer name which desired to be notified
         * - parameter userInfo: The information which desired to be passed to observer. It can be passed nil
         */
        public func publishMessage(withName: String, userInfo: [AnyHashable:Any]?) {
            EUIKit.LogInterface.log(withLevel: .Info, "The notification is received with name: \(withName) - User Info: \(userInfo?.description ?? "nil")")
            NotificationCenter.default.post(name: Notification.Name(withName), object: nil, userInfo: userInfo)
        }
        
        /**
         * Publishes message to observers and notifies them.
         *
         * - parameter withName: The observer name which desired to be notified
         * - parameter object: Any object to notify only specified observers
         * - parameter userInfo: The information which desired to be passed to observer. It can be passed nil
         */
        public func publishMessage(withName: String, object: Any?, userInfo: [AnyHashable:Any]?) {
            EUIKit.LogInterface.log(withLevel: .Info, "The notification is received with name: \(withName) - Object: \(object ?? "nil") - User Info: \(userInfo?.description ?? "nil")")
            NotificationCenter.default.post(name: Notification.Name(withName), object: object, userInfo: userInfo)
        }
        
        // MARK: - Private Methods
        
        /**
         * Adds standard observers to Notification Engine Delegates.
         */
        private func addStandardObservers() {
            self.addAppStateObservers(shouldAdd: self.shouldAddStateObservers)
        }
        
        private func addAppStateObservers(shouldAdd: Bool) {
            if shouldAdd {
                NotificationCenter.default.addObserver(self, selector: #selector(applicationWillResignActive), name: .applicationWillResignActive, object: nil)
                NotificationCenter.default.addObserver(self, selector: #selector(applicationDidBecomeActive), name: .applicationDidBecomeActive, object: nil)
                NotificationCenter.default.addObserver(self, selector: #selector(applicationWillEnterForeGround), name: .applicationWillEnterForeGround, object: nil)
                NotificationCenter.default.addObserver(self, selector: #selector(applicationWillEnterBackground), name: .applicationWillEnterBackground, object: nil)
                NotificationCenter.default.addObserver(self, selector: #selector(applicationWillTerminate), name: .applicationWillTerminate, object: nil)
            } else {
                NotificationCenter.default.removeObserver(self, name: .applicationWillResignActive, object: nil)
                NotificationCenter.default.removeObserver(self, name: .applicationDidBecomeActive, object: nil)
                NotificationCenter.default.removeObserver(self, name: .applicationWillEnterForeGround, object: nil)
                NotificationCenter.default.removeObserver(self, name: .applicationWillEnterBackground, object: nil)
                NotificationCenter.default.removeObserver(self, name: .applicationWillTerminate, object: nil)
            }
        }
        
        /**
         * Adds delegate to list of the listeners.
         * - important: Only calls delegate if **addObservers()** method is called.
         * - parameter delegate: Class with conforms **NotificationObserverDelegate**
         */
        public func addDelegate(_ delegate: NotificationObserverDelegate) {
            if !(self.delegates.contains{ $0.isEqual(delegate) }) {
                self.delegates.append(delegate)
            }
        }
        
        private override init() {
            super.init()
            self.addStandardObservers()
        }
        
        @objc private func applicationWillResignActive() {
            if shouldCallDelegates {
                EUIKit.LogInterface.log(withLevel: .Info, "------------- APPLICATION WILL RESIGN ACTIVE -------------")
                for delegate in delegates {
                    delegate.didApplicationStateChanged(to: .applicationWillResignActive)
                }
            }
        }
        
        @objc private func applicationDidBecomeActive() {
            if shouldCallDelegates {
                EUIKit.LogInterface.log(withLevel: .Info, "------------- APPLICATION DID BECOME ACTIVE -------------")
                for delegate in delegates {
                    delegate.didApplicationStateChanged(to: .applicationDidBecomeActive)
                }
            }
        }
        
        @objc private func applicationWillEnterForeGround() {
            if shouldCallDelegates {
                EUIKit.LogInterface.log(withLevel: .Info, "------------- APPLICATION WILL ENTER FOREGROUND -------------")
                for delegate in delegates {
                    delegate.didApplicationStateChanged(to: .applicationWillEnterForeGround)
                }
            }
        }
        
        @objc private func applicationWillEnterBackground() {
            if shouldCallDelegates {
                EUIKit.LogInterface.log(withLevel: .Info, "------------- APPLICATION WILL ENTER BACKGROUND -------------")
                for delegate in delegates {
                    delegate.didApplicationStateChanged(to: .applicationWillEnterBackground)
                }
            }
        }
        
        @objc private func applicationWillTerminate() {
            if shouldCallDelegates {
                EUIKit.LogInterface.log(withLevel: .Info, "------------- APPLICATION IS ABOUT TO TERMINATE -------------")
                for delegate in delegates {
                    delegate.didApplicationStateChanged(to: .applicationWillTerminate)
                }
            }
        }
        
    }
    
}
