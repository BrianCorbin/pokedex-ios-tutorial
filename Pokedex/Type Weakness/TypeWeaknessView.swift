//
//  TypeWeaknessView.swift
//  Pokedex
//
//  Created by TempUser on 6/16/20.
//  Copyright © 2020 bestcoast. All rights reserved.
//

import UIKit
import Foundation

@IBDesignable
class TypeWeaknessView: UIView {

    @IBOutlet var contentView: UIView!
    @IBOutlet weak var iconView: UIView!
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var damageMultiplierLabel: UILabel!
    
    var type: Type = .grass {
        didSet {
            loadTypeData()
        }
    }
    
    var damageMultiplier: Double = 1.0 {
        didSet {
            updateDamageMultiplier()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.commonInit()
    }
    
    private func commonInit() {
        Bundle(for: TypeWeaknessView.self).loadNibNamed("TypeWeaknessView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]

        contentView.layer.cornerRadius = contentView.frame.height / 2
        iconView.layer.cornerRadius = iconView.frame.height / 2
    }
    
    private func updateDamageMultiplier() {
        let numberFormatter = NumberFormatter()
        numberFormatter.maximumIntegerDigits = 1
        numberFormatter.minimumIntegerDigits = 1
        numberFormatter.maximumFractionDigits = 2
        numberFormatter.minimumFractionDigits = 1
        
        if damageMultiplier > 1.0 {
            damageMultiplierLabel.textColor = UIColor(hex: "D12F2F")
        } else if damageMultiplier == 1.0 {
            damageMultiplierLabel.textColor = UIColor(hex: "AAAAAA")!
        } else {
            damageMultiplierLabel.textColor = UIColor(hex: "37AC1E")
        }
        
        let damageMultiplierFormatted = numberFormatter.string(from: NSNumber(value: damageMultiplier))!
        damageMultiplierLabel.text = "\(damageMultiplierFormatted)"
    }
    
    private func loadTypeData() {
        iconImageView.image = type.icon()
        iconView.backgroundColor = type.color()
    }
}
