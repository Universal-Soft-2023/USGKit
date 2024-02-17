//
//  ColoredSwitch.swift
//  Tetris
//
//  Created by Михаил Разин on 12.04.2023.
//

import Foundation
import UIKit


public final class ColoredSwitch: UIView {
    
    private var offFrame: CGRect {
        let f = self.frame
        let size = f.height - self.borderWidth * 2 - self.switcherPadding * 2
        return .init(
            x: 0 + self.borderWidth + self.switcherPadding,
            y: 0 + self.borderWidth + self.switcherPadding,
            width: size,
            height: size
        )
    }
    
    private var onFrame: CGRect {
        let f = self.frame
        let size = f.height - self.borderWidth * 2 - self.switcherPadding * 2
        return .init(
            x: f.width - self.borderWidth - self.switcherPadding - size,
            y: 0 + self.borderWidth + self.switcherPadding,
            width: size,
            height: size
        )
    }
    
    var mainColor: UIColor = UGKMainThemeColor {
        didSet {
            switcher.backgroundColor = mainColor
            self.layer.borderColor = mainColor.cgColor
        }
    }
    
    var borderWidth: CGFloat = 4 {
        didSet {
            self.layer.borderWidth = borderWidth
        }
    }
    
    var switchSound: Bool = true
    
    var switcherPadding: CGFloat = 4 {
        didSet {
            self.setValue()
        }
    }
    
    var isCircle: Bool = USGColoredSwitchDefaultIsCircleValue
    
    var key: String? = nil {
        didSet {
            self.setValue()
        }
    }
    
    private let switcher = UIView()
    
    init(
        key: String,
        mainColor: UIColor = UGKMainThemeColor,
        backgroundColor: UIColor = UIColor(white: 0, alpha: 0.3),
        isCircle: Bool = USGColoredSwitchDefaultIsCircleValue,
        borderWidth: CGFloat = 4,
        switcherPadding: CGFloat = 4,
        switchSound: Bool = true
    ) {
        super.init(frame: .zero)
        setHierarchy()
        self.key = key
        self.mainColor = mainColor
        self.backgroundColor = backgroundColor
        self.isCircle = isCircle
        self.borderWidth = borderWidth
        self.switchSound = switchSound
        self.switcherPadding = switcherPadding
    }
    
    init() {
        super.init(frame: .zero)
        setHierarchy()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setHierarchy() {
        clipsToBounds = true
        self.addSubview(switcher)
        
        switcher.backgroundColor = mainColor
        self.layer.borderColor = mainColor.cgColor
        self.layer.borderWidth = borderWidth
        
        setValue(animated: false)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(onTap))
        self.addGestureRecognizer(tap)
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        if isCircle {
            self.layer.cornerRadius = self.frame.height / 2
            self.switcher.layer.cornerRadius = self.switcher.frame.height / 2
        } else {
            self.layer.cornerRadius = 1
            self.switcher.layer.cornerRadius = 1
        }
        setValue()
    }
    
    
    
    @objc private func onTap() {
        guard let key = key else { return }
        let val = UserDefaults.standard.bool(forKey: key)
        UserDefaults.standard.set(!val, forKey: key)
        setValue()
        if switchSound {
            USGDefaultColoredSwitchOnTapSound()
        }
    }
    
    private func setValue(animated: Bool = true) {
        guard let key = key else { return }
        let val = UserDefaults.standard.bool(forKey: key)
        UIView.animate(withDuration: animated ? 0.2 : 0, delay: 0, options: .curveEaseIn, animations: {
            self.switcher.frame = val ? self.onFrame : self.offFrame
        })
    }
}
