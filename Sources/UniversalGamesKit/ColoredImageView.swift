//
//  UIImageExtension.swift
//  Flagmania
//
//  Created by Михаил Разин on 03.05.2022.
//

import Foundation
import UIKit

class ColoredImageView: UIImageView {
    
    var buttonSound: Bool = true
    
    var themeColor: UIColor? = mainThemeColor

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

    var onTap: (() -> Void)? {
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
    
    init(coloredImg: UIImage?, color: UIColor? = nil, tapSound: Bool = true, onTap: (() -> Void)? = nil) {
        super.init(frame: .zero)
        if let c = color {
            self.themeColor = c
        }
        if let im = coloredImg {
            self.coloredImage = im
        }
        if let a = onTap {
            self.onTap = a
        }
        self.buttonSound = tapSound
        contentMode = .scaleAspectFit
    }
    
    init(notColoredImg: UIImage?, tapSound: Bool = true, onTap: (() -> Void)? = nil) {
        super.init(frame: .zero)
        self.notColoredImage = notColoredImg
        if let a = onTap {
            self.onTap = a
        }
        self.buttonSound = tapSound
        contentMode = .scaleAspectFit
    }
    
    init() {
        super.init(frame: .zero)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func actionOnTap() {
        if buttonSound {
            SOUNDS.buttonSound()
        }
        completion?()
    }
}
