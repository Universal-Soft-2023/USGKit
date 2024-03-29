//
//  File.swift
//  
//
//  Created by Михаил Разин on 15.02.2024.
//

import Foundation
import UIKit

public var USGMainFontFamily: String = "Marker felt"
public var USGMainFamilyFontMultiplier: CGFloat = 1

public var USGMainBackgroundColor: UIColor = .white
public var USGMainThemeColor: UIColor = .black

public var USGColoredSwitchDefaultIsCircleValue = true

public var USGUpperButtonSideInset: CGFloat = 30 * screenWidthMultiplyer
public var USGUpperButtonTopInset: CGFloat = 70 - (isOldScreen ? 30 : 0)
public var USGUpperButtonWidth: CGFloat = 60 * screenHeightMultiplyer
public var USGUpperButtonHeight: CGFloat = 60 * screenHeightMultiplyer

public var USGDefaultColoredLabelOnTapSound: (() -> Void) = {}
public var USGDefaultColoredButtonOnTapSound: (() -> Void) = {}
public var USGDefaultColoredImageViewOnTapSound: (() -> Void) = {}
public var USGDefaultColoredSwitchOnTapSound: (() -> Void) = {}

//public var USGSelfAdsThisApp: SelfAds?
//public var USGSelfAdsExcept: [SelfAds] = []
//public var USGSelfAdsUpdateSeconds: Double = 60



public var hasSafeArea: Bool {
    guard #available(iOS 11.0, *), let topPadding = UIApplication.shared.keyWindow?.safeAreaInsets.top, topPadding > 24 else {
        return false
    }
    return true
}

// Screen width.
public var screenWidth: CGFloat {
    return UIScreen.main.bounds.width
}

// Screen height.
public var screenHeight: CGFloat {
    return UIScreen.main.bounds.height
}

public var iphone13height: CGFloat {
    return 844
}

public var iphone13width: CGFloat {
    return 390
}

public var screenHeightMultiplyer: CGFloat {
    return screenHeight / iphone13height
}

public var screenWidthMultiplyer: CGFloat {
    return screenWidth / iphone13width
}

public var isOldScreen: Bool {
    let prop = UIScreen.main.bounds.width / UIScreen.main.bounds.height
    if prop > 0.5 {
        return true
    }
    return false
}







