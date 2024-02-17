//
//  SettingsRow.swift
//  Tetris
//
//  Created by Михаил Разин on 12.04.2023.
//

import Foundation
import UIKit

let settingsRowFontSize = 36 * UGKMainFamilyFontMultiplier

public final class SettingsRow: UIView {
    public var text: String? {
        set {
            title.text = newValue
        }
        get {
            title.text
        }
    }
    
    let title = ColoredLabel.def
        .mainFamilyFont(settingsRowFontSize)
        .textAlignment(.left)
    
    let control = ColoredSwitch()
    
    init() {
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public init(key: String, text: String = "") {
        super.init(frame: .zero)
        title.text = text
        control.key = key
        setHierarchy()
    }
    
    func setHierarchy() {
        self.addWithAutolayout(title)
        title.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        title.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        title.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        title.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 100).isActive = true
        
        
        self.addWithAutolayout(control)
        title.heightAnchor.constraint(equalToConstant: 40).isActive = true
        title.widthAnchor.constraint(equalToConstant: 70).isActive = true
        title.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        title.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
    }
}
