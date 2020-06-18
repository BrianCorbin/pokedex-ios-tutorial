//
//  StatBar.swift
//  Pokedex
//
//  Created by TempUser on 6/17/20.
//  Copyright © 2020 bestcoast. All rights reserved.
//

import UIKit

@IBDesignable
class StatBar: UIView {
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var barFill: UIView!
    @IBOutlet weak var fillWidthConstraint: NSLayoutConstraint!
    
    private let fillMax = 255
    
    var fillCurrent = 25 {
        didSet {
            let newMultiplier = CGFloat(fillCurrent) / CGFloat(fillMax)
            fillWidthConstraint = fillWidthConstraint.setMultiplier(multiplier: newMultiplier)
            layoutSubviews()
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
        Bundle(for: StatBar.self).loadNibNamed("StatBar", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        contentView.layer.cornerRadius = contentView.bounds.height / 2
        barFill.layer.cornerRadius = contentView.frame.height / 2
    }
    
}
