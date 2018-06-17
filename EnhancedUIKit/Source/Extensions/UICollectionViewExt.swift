//
//  UICollectionViewExt.swift
//  EnhancedUIKit
//
//  Created by Burak Uzunboy on 16.06.2018.
//  Copyright © 2018 EUIKit. All rights reserved.
//

import UIKit

public extension UICollectionView {
    
    /**
     * Dequeues cell and initializes with the given object.
     * - parameter withIdentifier: A string identifying the cell object to be reused. This parameter must not be nil
     * - parameter index: The index path specifying the location of the cell
     * - parameter object: Any object to use for cell initialization
     * - parameter viewController: Use **self** if specification is needed. This parameter can be nil
     * - returns: **EUICollectionViewCell** which inherited from *UICollectionViewCell*
     */
    func dequeueReusableCell(withIdentifier: String, for index: IndexPath, with object: Any?, viewController: UIViewController? = nil) -> EUICollectionViewCell {
        let cell = self.dequeueReusableCell(withReuseIdentifier: withIdentifier, for: index) as! EUICollectionViewCell
        if let obj = object {
            cell.initialize(with: obj)
        }
        cell.superViewController = viewController
        return cell
    }
    
    /**
     * Dequeues an empty cell. This cell shouldn't be used for representation.
     *
     * It can be used for running from if else loops in the *cellForItemAt* methods.
     * - returns: **UICollectionViewCell** which shouldn't be used where it may be called.
     */
    func dequeueEmptyCell() -> UICollectionViewCell {
        return self.dequeueReusableCell(withReuseIdentifier: "empty", for: IndexPath(item: 0, section: 0))
    }
    
}
