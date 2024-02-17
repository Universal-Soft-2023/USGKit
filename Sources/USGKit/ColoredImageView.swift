//
//  UIImageExtension.swift
//  Flagmania
//
//  Created by Михаил Разин on 03.05.2022.
//

import Foundation
import UIKit

public extension ColoredImageView {
    public static var def: ColoredImageView {
        let imageView = ColoredImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
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
    func notColoredImg(_ val: UIImage?) -> Self {
        self.notColoredImage = val
        return self
    }
    
    @discardableResult
    func coloredImg(_ val: UIImage?) -> Self {
        self.coloredImage = val
        return self
    }
    
    @discardableResult
    public func coloredImage(_ val: UIImage, color: UIColor) -> Self {
        self.themeColor = color
        self.coloredImage = val
        return self
    }
    
    @discardableResult
    func circled(_ val: Bool) -> Self {
        self.isCircle = val
        return self
    }
}

public class ColoredImageView: UIImageView {
    
    private var hasOnTapSound: Bool = true
    
    private var isCircle: Bool = false
    
    var themeColor: UIColor? = UGKMainThemeColor

    var coloredImage: UIImage? {
        set {
            if let tc = themeColor {
                self.image = newValue?.withRenderingMode(.alwaysTemplate)
                self.tintColor = tc

            } else {
                self.image = image
            }
        }
        get {
            image
        }
    }
    
    var notColoredImage: UIImage? {
        set {
            themeColor = nil
            coloredImage = nil
            self.image = newValue
        }
        get {
            image
        }
    }
    
    private var completion: (() -> Void)?
    private var customOnTapSound: (() -> Void)?

    private var onTap: (() -> Void)? {
        set {
            if newValue == nil {
                return
            }
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
                USGDefaultColoredImageViewOnTapSound()
            }
        }
        completion?()
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        if isCircle {
            self.layer.cornerRadius = self.layer.frame.height / 2
            clipsToBounds = true
        } else {
            self.layer.cornerRadius = 0
        }
    }
}
