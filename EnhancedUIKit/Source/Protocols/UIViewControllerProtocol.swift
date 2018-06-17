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
