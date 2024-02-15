//
//  SelfAds.swift
//  CheckColor
//
//  Created by Михаил Разин on 28.04.2022.
//

import Foundation
import UIKit

public extension UIColor {
    static var adsBackgroundColor: UIColor? {
        UIColor(named: "adsBackgroundColor")
    }
}

enum SelfAds: CaseIterable {
    case picrotator
    case countdown
    case bricks
    case rainbowmania
    case japaneseRiver

    var uiImage: UIImage? {
        let postfix = "Rainbowmania" 
        switch self {
        case .picrotator:
            return UIImage(named: "PicrotatorAds" + postfix)
        case .countdown:
            return UIImage(named: "CountdownAds" + postfix)
        case .bricks:
            return UIImage(named: "BricksAds" + postfix)
        case .rainbowmania:
            return UIImage(named: "RainbowmaniaAds" + postfix)
        case .japaneseRiver:
            return UIImage(named: "JapaneseRiverAds" + postfix)
        }
    }
    
    var link: String {
        switch self {
        case .picrotator:
            return "https://apps.apple.com/app/picrotator/id1586046078"
        case .countdown:
            return "https://apps.apple.com/app/math-countdown/id1460485494"
        case .bricks:
            return "https://apps.apple.com/app/bricks-countdown/id1501429009"
        case .rainbowmania:
            return "https://apps.apple.com/app/bricks-countdown/id1620619554"
        case .japaneseRiver:
            return "https://apps.apple.com/app/japanese-river-iq-test/id1669714017"
        }
    }
}

class SelfAdsView: UIImageView {
    
    var app: SelfAds? {
        didSet {
            self.image = app?.uiImage
        }
    }
    var timer = Timer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setSubviews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setSubviews()
    }
    
    func setSubviews() {
        self.backgroundColor = .adsBackgroundColor
        let tap = UITapGestureRecognizer(target: self, action: #selector(onTap))
        self.addGestureRecognizer(tap)
        self.timer = Timer.scheduledTimer(withTimeInterval: 120, repeats: true, block: { [weak self] _ in
            self?.updateCounting()
        })
        contentMode = .scaleAspectFit
        self.isUserInteractionEnabled = true
        self.updateCounting()
    }
    
    func updateCounting(){
        app = SelfAds.allCases.randomElement()
    }
    
    @objc func onTap() {
        if let link = app?.link {
            UIApplication.shared.open(URL(string: link)!, options: [:], completionHandler: {_ in })
        }
    }
}
