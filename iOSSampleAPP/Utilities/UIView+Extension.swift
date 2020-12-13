//
//  UIView+Extension.swift
//  iOSSampleAPP
//
//  Created by Muhammad Waqas on 12/12/2020.
//

import UIKit

extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
}
