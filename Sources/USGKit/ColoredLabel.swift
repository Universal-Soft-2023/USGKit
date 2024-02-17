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
        label.textColor = UGKMainThemeColor
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
    public func font(_ val: UIFont?) -> Self {
        self.font = val
        return self
    }
    
    @discardableResult
    public func numberOfLines(_ val: Int) -> Self {
        self.numberOfLines = val
        return self
    }
    
    @discardableResult
    public func minimumScaleFactor(_ val: CGFloat) -> Self {
        self.minimumScaleFactor = val
        return self
    }
    
    @discardableResult
    public func adjustsFontSizeToFitWidth(_ val: Bool) -> Self {
        self.adjustsFontSizeToFitWidth = val
        return self
    }
    
    @discardableResult
    public func adjustsFontSizeToFitWidthWith(minimumScaleFactor: CGFloat) -> Self {
        self.adjustsFontSizeToFitWidth = true
        self.minimumScaleFactor = minimumScaleFactor
        return self
    }
    
    @discardableResult
    public func textAlignment(_ val: NSTextAlignment) -> Self {
        self.textAlignment = val
        return self
    }
    
    @discardableResult
    public func textColor(_ val: UIColor) -> Self {
        self.textColor = val
        return self
    }
    
    @discardableResult
    public func text(_ val: String?) -> Self {
        self.text = val
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
