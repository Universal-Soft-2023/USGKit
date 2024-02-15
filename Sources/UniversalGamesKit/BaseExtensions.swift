//
//  BaseExtensions.swift
//  Tetris
//
//  Created by Михаил Разин on 18.03.2023.
//

import Foundation
import UIKit

extension Int {
    var cgFloat: CGFloat {
        return CGFloat(self)
    }
}

extension UIFont {
    static func mainFamilyFont(_ size: CGFloat) -> UIFont {
        return UIFont(name: mainFontFamily, size: size * mfm) ?? .systemFont(ofSize: size)
    }
}
//func mainFamilyFont(_ size: CGFloat) -> UIFont {
//    return UIFont(name: mainFontFamily, size: size * mfm) ?? .systemFont(ofSize: size)
//}
