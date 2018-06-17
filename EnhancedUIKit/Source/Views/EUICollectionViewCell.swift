//
//  EUICollectionViewCell.swift
//  EnhancedUIKit
//
//  Created by Burak Uzunboy on 16.06.2018.
//  Copyright © 2018 EUIKit. All rights reserved.
//

import UIKit

open class EUICollectionViewCell: UICollectionViewCell, MainUIProtocol {
    
    /**
     * Super view controller of the cell. It may be nil.
     */
    public internal(set) var superViewController: UIViewController?
    
    /**
     * Initializes View with the given object.
     * Can be used to configure view with the parameters.
     * - parameter object: Any object to use in initializing
     */
    public func initialize(with object: Any) {
        
    }
    
}
