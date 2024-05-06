//
//  UIViewExtension.swift
//  Tetris
//
//  Created by Михаил Разин on 16.03.2023.
//

import Foundation
import UIKit

public extension UIView {
    func setMainBackground() {
        self.backgroundColor = USGMainBackgroundColor
    }
    
    func setMainTheme() {
        self.backgroundColor = USGMainThemeColor
    }
    
    func leftUpperButtonConstraints(size: CGFloat? = nil) {
        guard let superV = superview else { return }
        self.leftAnchor.constraint(equalTo: superV.leftAnchor, constant: USGUpperButtonSideInset).isActive = true
        self.topAnchor.constraint(equalTo: superV.topAnchor, constant: USGUpperButtonTopInset).isActive = true
        self.widthAnchor.constraint(equalToConstant: size ?? USGUpperButtonWidth).isActive = true
        self.heightAnchor.constraint(equalToConstant: size ?? USGUpperButtonHeight).isActive = true
    }
    
    func rightUpperButtonConstraints(size: CGFloat? = nil) {
        guard let superV = superview else { return }
        self.rightAnchor.constraint(equalTo: superV.rightAnchor, constant: -USGUpperButtonSideInset).isActive = true
        self.topAnchor.constraint(equalTo: superV.topAnchor, constant: USGUpperButtonTopInset).isActive = true
        self.widthAnchor.constraint(equalToConstant: size ?? USGUpperButtonWidth).isActive = true
        self.heightAnchor.constraint(equalToConstant: size ?? USGUpperButtonHeight).isActive = true
    }
}
