//
//  UIColorExtension.swift
//  Tutorial
//
//  Created by Jonah Pelfrey on 6/10/20.
//  Copyright © 2020 Jonah Pelfrey. All rights reserved.
//

import UIKit

extension UIColor {
    convenience init(hex: Int, alpha: CGFloat = 1) {
        let r = CGFloat((hex & 0xFF0000) >> 16) / 255
        let g = CGFloat((hex & 0xFF00) >> 8) / 255
        let b = CGFloat((hex & 0xFF)) / 255
        self.init(red: r, green: g, blue: b, alpha: alpha)
    }
}
