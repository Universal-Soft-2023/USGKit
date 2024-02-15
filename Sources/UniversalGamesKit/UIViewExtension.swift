//
//  UIViewExtension.swift
//  Tetris
//
//  Created by Михаил Разин on 16.03.2023.
//

import Foundation
import UIKit

extension UIView {
    func setMainBackground() {
        self.backgroundColor = UGKMainBackgroundColor
    }
    
    func setMainTheme() {
        self.backgroundColor = UGKMainThemeColor
    }
    
    func additional(_ additional: ((UIView) -> Void)) -> UIView {
        additional(self)
        return self
    }
    
    func leftUpperButtonConstraints() {
        self
            .left(UGKUpperButtonSideInset)
            .top(UGKUpperButtonTopInset)
            .width(UGKUpperButtonWidth)
            .height(UGKUpperButtonHeight)
    }
    
    func rightUpperButtonConstraints() {
        self
            .right(UGKUpperButtonSideInset)
            .top(UGKUpperButtonTopInset)
            .width(UGKUpperButtonWidth)
            .height(UGKUpperButtonHeight)
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
