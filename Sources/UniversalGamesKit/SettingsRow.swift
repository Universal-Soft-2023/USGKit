//
//  SettingsRow.swift
//  Tetris
//
//  Created by Михаил Разин on 12.04.2023.
//

import Foundation
import UIKit

let settingsRowFont = UIFont.mainFamilyFont(36)

class SettingsRow: UIView {
    let title = ColoredLabel(font: settingsRowFont, alignment: .left)
    let control = ColoredSwitch()
    
    init() {
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(key: String, text: String) {
        super.init(frame: .zero)
        title.text = text
        control.key = key
        setHierarchy()
    }
    
    func setHierarchy() {
        self.addWithAutolayout(title)
            .top()
            .bottom()
            .left()
            .right(100)
        
        self.addWithAutolayout(control)
            .height(40)
            .width(70)
            .centerY()
            .right()
        
    }
}
