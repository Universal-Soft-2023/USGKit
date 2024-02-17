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
        self.backgroundColor = UGKMainBackgroundColor
    }
    
    func setMainTheme() {
        self.backgroundColor = UGKMainThemeColor
    }
    
    func leftUpperButtonConstraints() {
        guard let superV = superview else { return }
        self.leftAnchor.constraint(equalTo: superV.leftAnchor, constant: UGKUpperButtonSideInset).isActive = true
        self.topAnchor.constraint(equalTo: superV.topAnchor, constant: UGKUpperButtonTopInset).isActive = true
        self.widthAnchor.constraint(equalTo: superV.widthAnchor, constant: UGKUpperButtonWidth).isActive = true
        self.heightAnchor.constraint(equalTo: superV.heightAnchor, constant: UGKUpperButtonHeight).isActive = true
    }
    
    func rightUpperButtonConstraints() {
        guard let superV = superview else { return }
        self.rightAnchor.constraint(equalTo: superV.rightAnchor, constant: UGKUpperButtonSideInset).isActive = true
        self.topAnchor.constraint(equalTo: superV.topAnchor, constant: UGKUpperButtonTopInset).isActive = true
        self.widthAnchor.constraint(equalTo: superV.widthAnchor, constant: UGKUpperButtonWidth).isActive = true
        self.heightAnchor.constraint(equalTo: superV.heightAnchor, constant: UGKUpperButtonHeight).isActive = true
    }
    
    @discardableResult
    func add(_ newView: UIView) -> UIView {
        self.addSubview(newView)
        return self
    }
    
    @discardableResult
    func addWithAutolayout(_ newView: UIView) -> UIView {
        newView.translatesAutoresizingMaskIntoConstraints = false
        add(newView)
        return newView
    }
}
