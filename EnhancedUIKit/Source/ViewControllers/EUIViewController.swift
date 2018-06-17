//
//  EUIViewController.swift
//  EnhancedUIKit
//
//  Created by Burak Uzunboy on 15.06.2018.
//  Copyright © 2018 EUIKit. All rights reserved.
//

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
