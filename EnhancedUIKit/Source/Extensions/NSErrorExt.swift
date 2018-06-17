//
//  NSErrorExt.swift
//  EnhancedUIKit
//
//  Created by Burak Uzunboy on 16.06.2018.
//  Copyright © 2018 EUIKit. All rights reserved.
//

import UIKit

public extension NSError {
    
    convenience init(domain: String, code: Int, description: String?) {
        self.init(domain: domain, code: code, userInfo: (description != nil) ? [NSLocalizedDescriptionKey: description!] : nil)
    }

}
