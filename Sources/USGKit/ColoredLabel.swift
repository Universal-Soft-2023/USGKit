//
//  ColoredLabel.swift
//  Tetris
//
//  Created by Михаил Разин on 16.03.2023.
//

import Foundation
import UIKit

public extension ColoredLabel {
    static var def: ColoredLabel {
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
    func onTap(_ val: @escaping (() -> Void)) -> Self {
        self.onTap = val
        return self
    }
    
    @discardableResult
    func hasOnTapSound(_ val: Bool) -> Self {
        self.hasOnTapSound = val
        return self
    }
    
    @discardableResult
    func customOnTapSound(_ val: @escaping (() -> Void)) -> Self {
        self.customOnTapSound = val
        return self
    }
    
    @discardableResult
    func mainFamilyFont(_ ofSize: CGFloat) -> Self {
        self.font = .mainFamilyFont(ofSize)
        return self
    }
    
    @discardableResult
    func font(_ val: UIFont?) -> Self {
        self.font = val
        return self
    }
    
    @discardableResult
    func systemFont(ofSize: CGFloat) -> Self {
        self.font = .systemFont(ofSize: ofSize)
        return self
    }
    
    @discardableResult
    func systemFont(ofSize: CGFloat, weight: UIFont.Weight) -> Self {
        self.font = .systemFont(ofSize: ofSize, weight: weight)
        return self
    }
    
    @discardableResult
    func italicSystemFont(ofSize: CGFloat) -> Self {
        self.font = .italicSystemFont(ofSize: ofSize)
        return self
    }
    
    @discardableResult
    func boldSystemFont(ofSize: CGFloat) -> Self {
        self.font = .boldSystemFont(ofSize: ofSize)
        return self
    }
    
    @discardableResult
    func semiboldSystemFont(ofSize: CGFloat) -> Self {
        self.font = .systemFont(ofSize: ofSize, weight: .semibold)
        return self
    }
    
    @discardableResult
    func lightSystemFont(ofSize: CGFloat) -> Self {
        self.font = .systemFont(ofSize: ofSize, weight: .light)
        return self
    }
    
    @discardableResult
    func numberOfLines(_ val: Int) -> Self {
        self.numberOfLines = val
        return self
    }
    
    @discardableResult
    func minimumScaleFactor(_ val: CGFloat) -> Self {
        self.minimumScaleFactor = val
        return self
    }
    
    @discardableResult
    func adjustsFontSizeToFitWidth(_ val: Bool) -> Self {
        self.adjustsFontSizeToFitWidth = val
        return self
    }
    
    @discardableResult
    func adjustsFontSizeToFitWidthWith(minimumScaleFactor: CGFloat) -> Self {
        self.adjustsFontSizeToFitWidth = true
        self.minimumScaleFactor = minimumScaleFactor
        return self
    }
    
    @discardableResult
    func textAlignment(_ val: NSTextAlignment) -> Self {
        self.textAlignment = val
        return self
    }
    
    @discardableResult
    func textColor(_ val: UIColor) -> Self {
        self.textColor = val
        return self
    }
    
    @discardableResult
    func text(_ val: String?) -> Self {
        self.text = val
        return self
    }
    
    @discardableResult
    func setup(_ closure: (Self) -> Void) -> Self {
        closure(self)
        return self
    }
}

public final class ColoredLabel: UILabel {
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
