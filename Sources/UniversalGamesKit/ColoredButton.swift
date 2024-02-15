//
//  ColoredButton.swift
//  Tetris
//
//  Created by Михаил Разин on 17.03.2023.
//

import Foundation
import UIKit

class ColoredButton: UIView {
    
    var label = UILabel()
    var buttonSound: Bool = true
    var autoscale: Bool = true

    var cornerRadiusDel: Int = 3

    private var completion: (() -> Void)?

    var onTap: (() -> Void)? {
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
    
    var text: String? {
        set {
            label.text = newValue
        }
        get {
            return label.text
        }
    }
    
    var font: UIFont? {
        set {
            label.font = newValue
        }
        get {
            return label.font
        }
    }
    
    init(
        text: String? = nil,
        font: UIFont? = nil,
        verticalPadding: CGFloat = 0,
        horizontalPadding: CGFloat = 0,
        cornerRadiusDel: Int = 3,
        lines: Int = 1,
        autoscale: Bool = true,
        color: UIColor = UGKMainThemeColor,
        textColor: UIColor = UGKMainBackgroundColor,
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
        
        addWithAutolayout(label)
            .top(verticalPadding)
            .bottom(verticalPadding)
            .left(horizontalPadding)
            .right(horizontalPadding)
        
        self.cornerRadiusDel = cornerRadiusDel
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
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = self.frame.height / CGFloat(cornerRadiusDel)
        self.layer.masksToBounds = true
    }
}
