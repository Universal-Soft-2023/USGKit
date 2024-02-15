//
//  ColoredLabel.swift
//  Tetris
//
//  Created by Михаил Разин on 16.03.2023.
//

import Foundation
import UIKit

class ColoredLabel: UILabel {
    var buttonSound: Bool = true
    var autoscale: Bool = true

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
    
    init(text: String? = nil, font: UIFont? = nil, alignment: NSTextAlignment = .center, lines: Int = 1, autoscale: Bool = true, color: UIColor = UGKMainThemeColor, tapSound: Bool = true, onTap: (() -> Void)? = nil) {
        super.init(frame: .zero)
        self.text = text == nil ? self.text : text
        self.font = font
        self.numberOfLines = lines
        if autoscale {
            self.minimumScaleFactor = 0.2
            self.adjustsFontSizeToFitWidth = true
        }
        self.textColor = color
        self.textAlignment = alignment
        if let a = onTap {
            self.onTap = a
        }
        self.buttonSound = tapSound
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
