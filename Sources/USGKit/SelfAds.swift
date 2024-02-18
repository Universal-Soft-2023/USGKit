//
//  SelfAds.swift
//  CheckColor
//
//  Created by Михаил Разин on 28.04.2022.
//

import Foundation
import UIKit

extension UIColor {
    static var adsBackgroundColor: UIColor? {
        UIColor.black
    }
}

fileprivate var updateSeconds: Double { USGSelfAdsUpdateSeconds }

public enum SelfAds: CaseIterable {
    
    static var thisApp: Self? { USGSelfAdsThisApp }
    
    static var except: [SelfAds] { USGSelfAdsExcept }
    
    public static var allCases: [SelfAds] {
        let arr: [Self] = [
            .gridPainter,
            .clearGrid,
            .justBricks,
            .picrotator,
            .mathCountdown,
            .bricksSeries,
            .bricksCountdown,
            .rainbowmania,
            .japaneseRiver,
            .bricksRacer,
            .stackAttack,
            .byDeveloper,
            .capitalMania,
            .flagMania,
        ]
        
        return arr.filter { $0 != thisApp && except.contains($0) == false }
    }
    
    case gridPainter
    case clearGrid
    case justBricks
    case picrotator
    case mathCountdown
    case bricksSeries
    case bricksCountdown
    case rainbowmania
    case japaneseRiver
    case bricksRacer
    case stackAttack
    case byDeveloper
    case capitalMania
    case flagMania

    
    
    var uiImage: UIImage? {
        let postfix = ".png"
        switch self {
            
        case .picrotator:
            return UIImage(named: "Picrotator" + postfix)
        case .mathCountdown:
            return UIImage(named: "MathCountdown" + postfix)
        case .bricksCountdown:
            return UIImage(named: "BricksCountdown" + postfix)
        case .rainbowmania:
            return UIImage(named: "Rainbowmania" + postfix)
        case .japaneseRiver:
            return UIImage(named: "JapaneseRiver" + postfix)
        case .justBricks:
            return UIImage(named: "JustBricks" + postfix)
        case .bricksRacer:
            return UIImage(named: "BricksRacer" + postfix)
        case .bricksSeries:
            return UIImage(named: "BrisksSeries" + postfix)
        case .stackAttack:
            return UIImage(named: "StackAttack" + postfix)
        case .byDeveloper:
            return UIImage(named: "ByDeveloper" + postfix)
        case .capitalMania:
            return UIImage(named: "Capitalmania" + postfix)
        case .flagMania:
            return UIImage(named: "Flagmania" + postfix)
        case .gridPainter:
            return UIImage(named: "GridPainter" + postfix)
        case .clearGrid:
            return UIImage(named: "ClearGrid" + postfix)
        }
    }
    
    var link: String {
        switch self {
        
        case .picrotator:
            return "https://apps.apple.com/app/pi%D1%81rotator/id1586046078"
        case .mathCountdown:
            return "https://apps.apple.com/app/math-countdown/id1460485494"
        case .bricksCountdown:
            return "https://apps.apple.com/app/bricks-countdown/id1501429009"
        case .rainbowmania:
            return "https://apps.apple.com/app/rainbowmania/id1620619554"
        case .japaneseRiver:
            return "https://apps.apple.com/app/japanese-river-iq-test/id1669714017"
        case .justBricks:
            return "https://apps.apple.com/app/just-bricks/id6448131642"
        case .bricksRacer:
            return "https://apps.apple.com/app/just-bricks-racer/id6449527876"
        case .bricksSeries:
            return "https://apps.apple.com/developer/mikhail-razin/id1460485493?see-all=i-phone-apps"
        case .stackAttack:
            return "https://apps.apple.com/app/just-stack-attack/id6449266462"
        case .byDeveloper:
            return "https://apps.apple.com/developer/mikhail-razin/id1460485493?see-all=i-phone-apps"
        case .capitalMania:
            return "https://apps.apple.com/app/quiz-capitalmania/id1626796266"
        case .flagMania:
            return "https://apps.apple.com/app/quiz-flagmania/id1622285385"
        case .gridPainter:
            return "https://apps.apple.com/app/grid-painter-game/id6462537514"
        case .clearGrid:
            return "https://apps.apple.com/app/clear-grid-game/id6463164435"
        }
    }
}

public class SelfAdsView: UIImageView {
    
    var app: SelfAds? {
        didSet {
            self.image = app?.uiImage
        }
    }
    var timer = Timer()
    
    public override init(frame: CGRect) {
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
        self.timer = Timer.scheduledTimer(withTimeInterval: updateSeconds, repeats: true, block: { [weak self] _ in
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
