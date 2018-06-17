//
//  EUITableViewCell.swift
//  EnhancedUIKit
//
//  Created by Burak Uzunboy on 16.06.2018.
//  Copyright © 2018 EUIKit. All rights reserved.
//

import UIKit

open class EUITableViewCell: UITableViewCell, MainUIProtocol {
    
    /**
     * Super view controller of the cell. It may be nil.
     */
    public internal(set) var superViewController: UIViewController?

    override open func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override open func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    /**
     * Initializes View with the given object.
     * Can be used to configure view with the parameters.
     * - parameter object: Any object to use in initializing
     */
    public func initialize(with object: Any) {

    }

}
