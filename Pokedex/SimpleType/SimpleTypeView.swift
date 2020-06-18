//
//  SimpleTypeView.swift
//  Pokedex
//
//  Created by TempUser on 6/15/20.
//  Copyright © 2020 bestcoast. All rights reserved.
//

import UIKit

@IBDesignable
class SimpleTypeView: UIView {

    @IBOutlet weak var typeNameLabel: UILabel!
    @IBOutlet weak var typeIconImageView: UIImageView!
    @IBOutlet weak var contentView: UIView!
    
    var type: Type = .grass {
        didSet {
            loadTypeData()
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
        Bundle(for: SimpleTypeView.self).loadNibNamed("SimpleTypeView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        contentView.layer.cornerRadius = 4
    }
    
    private func loadTypeData() {
        typeNameLabel.text = type.rawValue.uppercased()
        typeIconImageView.image = type.icon()
        typeIconImageView.tintColor = type.color()!
    }
}
