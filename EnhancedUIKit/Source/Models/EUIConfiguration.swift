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
            EUIKit.LogInterface.log(withLevel: self.LogLevel, "Log Level is changed from \(oldValue) to \(self.LogLevel) - was: \(oldValue)")
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
            EUIKit.LogInterface.log(withLevel: .Info, "Log file name is changed to: \(self.logFileName) - was: \(oldValue)")
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
            EUIKit.LogInterface.log(withLevel: .Info, "Log file limit is set to \(self.maximumLogFileSize) MB - was: \(oldValue)")
        }
    }
    
    
    // Private Propertiesxw
    
    private override init() {
        super.init()
    }
    
    // Internal Properties
    internal var isLogInterfaceStarted: Bool = false
    
}
