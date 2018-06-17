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

public extension UITableView {
    
    /**
     * Dequeues cell and initializes with the given object.
     * - parameter withIdentifier: A string identifying the cell object to be reused. This parameter must not be nil
     * - parameter index: The index path specifying the location of the cell
     * - parameter object: Any object to use for cell initialization
     * - parameter viewController: Use **self** if specification is needed. This parameter can be nil
     * - returns: **EUITableViewCell** which inherited from *UITableViewCell*
     */
    func dequeueReusableCell(withIdentifier: String, for index: IndexPath, with object: Any?, viewController: UIViewController? = nil) -> EUITableViewCell {
        let cell = self.dequeueReusableCell(withIdentifier: withIdentifier, for: index) as! EUITableViewCell
        if let obj = object {
            cell.initialize(with: obj)
        }
        cell.superViewController = viewController
        return cell
    }
    
    /**
     * Dequeues an empty cell. This cell shouldn't be used for representation.
     *
     * It can be used for running from if else loops in the *cellForRowAt* methods.
     * - returns: **UITableViewCell** which shouldn't be used where it may be called.
     */
    func dequeueEmptyCell() -> UITableViewCell {
        return self.dequeueReusableCell(withIdentifier: "empty")!
    }
    
}
