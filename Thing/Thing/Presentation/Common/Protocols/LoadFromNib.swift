//
//  NibLoadable.swift
//  Thing
//
//  Created by Daniele Boscolo on 10/06/18.
//  Copyright © 2018 Daniele Boscolo. All rights reserved.
//

import UIKit

protocol LoadFromNib {}

// Assigns
extension UIViewController: LoadFromNib {}

// Extensions
extension LoadFromNib where Self: UIViewController {
    static func loadFromNib() -> UIViewController {
        return Self(nibName: String(describing: self), bundle: Bundle(for: self))
    }
}
