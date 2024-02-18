//
//  ColoredLabel.swift
//  Tetris
//
//  Created by Михаил Разин on 16.03.2023.
//

import Foundation
import UIKit

public extension ColoredLabel {
    
}

public final class ColoredLabel: UILabel {
    public static var def: ColoredLabel {
        let label = ColoredLabel()
        label.textAlignment = .center
        label.numberOfLines = 1
        label.minimumScaleFactor = 0.2
        label.adjustsFontSizeToFitWidth = true
        label.textColor = USGMainThemeColor
        label.hasOnTapSound = true
        return label
    }
    
    @discardableResult
    public func onTap(_ val: @escaping (() -> Void)) -> Self {
        self.onTap = val
        return self
    }
    
    @discardableResult
    public func hasOnTapSound(_ val: Bool) -> Self {
        self.hasOnTapSound = val
        return self
    }
    
    @discardableResult
    public func customOnTapSound(_ val: @escaping (() -> Void)) -> Self {
        self.customOnTapSound = val
        return self
    }
    
    @discardableResult
    public func mainFamilyFont(_ ofSize: CGFloat) -> Self {
        self.font = .mainFamilyFont(ofSize)
        return self
    }
    
    @discardableResult
    public func setup(_ closure: (Self) -> Void) -> Self {
        closure(self)
        return self
    }
    
    
    
    
    
    
    
    
    
    var hasOnTapSound: Bool = true
    var autoscale: Bool = true

    private var completion: (() -> Void)?
    private var customOnTapSound: (() -> Void)?

    private var onTap: (() -> Void)? {
        set {
            self.completion = newValue
            self.isUserInteractionEnabled = true
            let tap = UITapGestureRecognizer(target: self, action: #selector(actionOnTap))
            self.addGestureRecognizer(tap)
        }
        get {
            completion
        }
    }
    
    @objc private func actionOnTap() {
        if hasOnTapSound {
            if let cus = customOnTapSound {
                cus()
            } else {
                USGDefaultColoredLabelOnTapSound()
            }
        }
        completion?()
    }
}
