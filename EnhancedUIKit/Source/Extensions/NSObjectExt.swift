//
//  NSObjectExt.swift
//  EnhancedUIKit
//
//  Created by Burak Uzunboy on 15.06.2018.
//  Copyright © 2018 EUIKit. All rights reserved.
//

import UIKit

public extension NSObject {
    
    /**
     * Returns name of the specified class
     */
    public var className: String {
        get {
            return getOnlyClassName()
        }
    }
    
    private func getOnlyClassName() -> String {
        let describing = String(describing: self)
        if let dotIndex = describing.index(of: "."), let commaIndex = describing.index(of: ":") {
            let afterDotIndex = describing.index(after: dotIndex)
            if(afterDotIndex < commaIndex) {
                return String(describing[afterDotIndex ..< commaIndex])
            }
        }
        return describing
    }
    
}
