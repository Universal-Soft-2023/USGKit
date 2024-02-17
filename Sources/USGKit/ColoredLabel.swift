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
    func textAlignment(_ val: NSTextAlignment) -> Self {
        self.textAlignment = val
        return self
    }
}

public class ColoredLabel: UILabel {
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
