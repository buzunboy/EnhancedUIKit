//
//  MainUIProtocol.swift
//  EnhancedUIKit
//
//  Created by Burak Uzunboy on 16.06.2018.
//  Copyright © 2018 EUIKit. All rights reserved.
//

import UIKit

protocol MainUIProtocol {
    
    /**
     * Initializes UIViewController with the given object.
     * Can be used to configure view controller with the parameters.
     * - parameter object: Any object to use in initializing
     */
    func initialize(with object: Any)

}
