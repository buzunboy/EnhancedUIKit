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

open class EUIViewController: UIViewController, UIViewControllerProtocol {
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        EUIKit.LogInterface.log(withLevel: .Verbose, "\(className) view is loaded")
        // Do any additional setup after loading the view.
    }
    
    override open func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        EUIKit.LogInterface.log(withLevel: .Verbose, "\(className) view will be appeared")
    }
    
    override open func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        EUIKit.LogInterface.log(withLevel: .Verbose, "\(className) view is appeared")
    }
    
    override open func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        EUIKit.LogInterface.log(withLevel: .Verbose, "\(className) view is disappeared")
    }
    
    override open func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        EUIKit.LogInterface.log(withLevel: .Verbose, "\(className) view will be disappeared")
    }
    
    override open func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        EUIKit.LogInterface.log(withLevel: .Error, "\(className) is received memory warning")
    }
    
    public func setTitle(to title: String) {
        self.navigationItem.title = title
        EUIKit.LogInterface.log(withLevel: .Verbose, "Title of the \(className) is set to \(title)")
    }
    
    /**
     * Sets right bar button to navigation bar with given name.
     * - parameter withTitle: Title for the button
     * - parameter willPushTo: Selector for when clicked to right bar button
     */
    public func setRightBarButton(withTitle: String, willPushTo: Selector) {
        let rightBtn = UIBarButtonItem(title: withTitle, style: .done, target: self, action: willPushTo)
        self.navigationItem.rightBarButtonItem = rightBtn
        EUIKit.LogInterface.log(withLevel: .Verbose, "Right bar button of the \(className) is set with title: \(withTitle) which pushes to: \(willPushTo)")
    }
    
    /**
     * Sets right bar button to navigation bar with given image name.
     * - parameter withImageName: Image name for the UIImage
     * - parameter willPushTo: Selector for when clicked to right bar button
     */
    public func setRightBarButton(withImageName: String, willPushTo: Selector) {
        let rightBtn = UIBarButtonItem(image: UIImage(named: withImageName), style: .done, target: self, action: willPushTo)
        self.navigationItem.rightBarButtonItem = rightBtn
        EUIKit.LogInterface.log(withLevel: .Verbose, "Right bar button of the \(className) is set with image name: \(withImageName) which pushes to: \(willPushTo)")
    }
    
    /**
     * Sets right bar button to navigation bar with given image.
     * - parameter withImageName: UIImage for the button
     * - parameter willPushTo: Selector for when clicked to right bar button
     */
    public func setRightBarButton(withImage: UIImage, willPushTo: Selector) {
        let rightBtn = UIBarButtonItem(image: withImage, style: .done, target: self, action: willPushTo)
        self.navigationItem.rightBarButtonItem = rightBtn
        EUIKit.LogInterface.log(withLevel: .Verbose, "Right bar button of the \(className) is set with image: \(withImage.description) which pushes to: \(willPushTo)")
    }
    
    /**
     * Sets left bar button to navigation bar.
     * - parameter withTitle: Title for the button
     * - parameter willPushTo: Selector for when clicked to left bar button
     */
    public func setLeftBarButton(withTitle: String, willPushTo: Selector) {
        let leftBtn = UIBarButtonItem(title: withTitle, style: .done, target: self, action: willPushTo)
        self.navigationItem.leftBarButtonItem = leftBtn
        EUIKit.LogInterface.log(withLevel: .Verbose, "Left bar button of the \(className) is set with title: \(withTitle) which pushes to: \(willPushTo)")
    }
    
    /**
     * Sets left bar button to navigation bar with given image name.
     * - parameter withImageName: Image name for the UIImage
     * - parameter willPushTo: Selector for when clicked to left bar button
     */
    public func setLeftBarButton(withImageName: String, willPushTo: Selector) {
        let leftBtn = UIBarButtonItem(image: UIImage(named: withImageName), style: .done, target: self, action: willPushTo)
        self.navigationItem.leftBarButtonItem = leftBtn
        EUIKit.LogInterface.log(withLevel: .Verbose, "Left bar button of the \(className) is set with image name: \(withImageName) which pushes to: \(willPushTo)")
    }
    
    /**
     * Sets left bar button to navigation bar with given image.
     * - parameter withImageName: UIImage for the button
     * - parameter willPushTo: Selector for when clicked to left bar button
     */
    public func setLeftBarButton(withImage: UIImage, willPushTo: Selector) {
        let leftBtn = UIBarButtonItem(image: withImage, style: .done, target: self, action: willPushTo)
        self.navigationItem.leftBarButtonItem = leftBtn
        EUIKit.LogInterface.log(withLevel: .Verbose, "Left bar button of the \(className) is set with image: \(withImage.description) which pushes to: \(willPushTo)")
    }
    
    /**
     * Initializes UIViewController with the given object.
     * Can be used to configure view controller with the parameters.
     * - parameter object: Any object to use in initializing
     */
    public func initialize(with object: Any) {
    }
    
}
