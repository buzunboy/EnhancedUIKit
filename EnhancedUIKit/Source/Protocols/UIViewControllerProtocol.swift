//
//  UIViewControllerProtocol.swift
//  EnhancedUIKit
//
//  Created by Burak Uzunboy on 16.06.2018.
//  Copyright © 2018 EUIKit. All rights reserved.
//

import UIKit

protocol UIViewControllerProtocol: MainUIProtocol {
    /**
     * Sets right bar button to navigation bar with given name.
     * - parameter withTitle: Title for the button
     * - parameter willPushTo: Selector for when clicked to right bar button
     */
    func setRightBarButton(withTitle: String, willPushTo: Selector)
    
    /**
     * Sets right bar button to navigation bar with given image name.
     * - parameter withImageName: Image name for the UIImage
     * - parameter willPushTo: Selector for when clicked to right bar button
     */
    func setRightBarButton(withImageName: String, willPushTo: Selector)
    /**
     * Sets right bar button to navigation bar with given image.
     * - parameter withImageName: UIImage for the button
     * - parameter willPushTo: Selector for when clicked to right bar button
     */
    func setRightBarButton(withImage: UIImage, willPushTo: Selector)
    
    /**
     * Sets left bar button to navigation bar.
     * - parameter withTitle: Title for the button
     * - parameter willPushTo: Selector for when clicked to left bar button
     */
    func setLeftBarButton(withTitle: String, willPushTo: Selector)
    
    /**
     * Sets left bar button to navigation bar with given image name.
     * - parameter withImageName: Image name for the UIImage
     * - parameter willPushTo: Selector for when clicked to left bar button
     */
    func setLeftBarButton(withImageName: String, willPushTo: Selector)
    
    /**
     * Sets left bar button to navigation bar with given image.
     * - parameter withImageName: UIImage for the button
     * - parameter willPushTo: Selector for when clicked to left bar button
     */
    func setLeftBarButton(withImage: UIImage, willPushTo: Selector)
    
}
