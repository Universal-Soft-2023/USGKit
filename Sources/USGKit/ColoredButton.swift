//
//  ColoredButton.swift
//  Tetris
//
//  Created by Михаил Разин on 17.03.2023.
//

import Foundation
import UIKit

public extension ColoredButton {
    static var def: ColoredButton {
        let button = ColoredButton()
        return button
    }
    
    var defaultConfig: Self {
        return self
    }
    
    
}

public final class ColoredButton: UIView {
    
    private var label = UILabel()
    private var buttonSound: Bool = true
    private var autoscale: Bool = true

    var cornerRadiusDel: Int = 3

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
    
    public var text: String? {
        set {
            label.text = newValue
        }
        get {
            return label.text
        }
    }
    
    public var font: UIFont? {
        set {
            label.font = newValue
        }
        get {
            return label.font
        }
    }
    
    public init(
        text: String? = nil,
        font: UIFont? = nil,
        verticalPadding: CGFloat = 0,
        horizontalPadding: CGFloat = 0,
        cornerRadiusDel: Int = 3,
        lines: Int = 1,
        autoscale: Bool = true,
        color: UIColor = USGMainThemeColor,
        textColor: UIColor = USGMainBackgroundColor,
        tapSound: Bool = true,
        alignment: NSTextAlignment = .center,
        onTap: (() -> Void)? = nil
    ) {
        super.init(frame: .zero)
        label.text = text == nil ? label.text : text
        label.font = font
        label.numberOfLines = lines
        if autoscale {
            self.label.minimumScaleFactor = 0.2
            self.label.adjustsFontSizeToFitWidth = true
        }
        label.textColor = textColor
        self.backgroundColor = color
        label.textAlignment = alignment
        if let a = onTap {
            self.onTap = a
        }
        self.buttonSound = tapSound
        
        label.translatesAutoresizingMaskIntoConstraints = false
        addSubview(label)
        label.topAnchor.constraint(equalTo: self.topAnchor, constant: verticalPadding).isActive = true
        label.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: verticalPadding).isActive = true
        label.leftAnchor.constraint(equalTo: self.leftAnchor, constant: verticalPadding).isActive = true
        label.rightAnchor.constraint(equalTo: self.rightAnchor, constant: verticalPadding).isActive = true

        
        self.cornerRadiusDel = cornerRadiusDel
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func actionOnTap() {
        if buttonSound {
            if let cus = customOnTapSound {
                cus()
            } else {
                USGDefaultColoredButtonOnTapSound()
            }
        }
        completion?()
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = self.frame.height / CGFloat(cornerRadiusDel)
        self.layer.masksToBounds = true
    }
}


