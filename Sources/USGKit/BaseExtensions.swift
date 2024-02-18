//
//  BaseExtensions.swift
//  Tetris
//
//  Created by Михаил Разин on 18.03.2023.
//

import Foundation
import UIKit

public extension Int {
    var cgFloat: CGFloat {
        return CGFloat(self)
    }
}

public extension UIFont {
    static func mainFamilyFont(_ size: CGFloat) -> UIFont {
        return UIFont(name: USGMainFontFamily, size: size * USGMainFamilyFontMultiplier) ?? .systemFont(ofSize: size)
    }
}
