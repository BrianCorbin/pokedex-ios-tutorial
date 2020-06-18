//
//  PokemonTypeView.swift
//  Pokedex
//
//  Created by TempUser on 6/17/20.
//  Copyright © 2020 bestcoast. All rights reserved.
//

import UIKit

@IBDesignable
class PokemonTypeView: UIView {
    
    @IBOutlet var contentView: UIView!
    
    @IBOutlet weak var typeIconImageVIew: UIImageView!
    @IBOutlet weak var typeNameLabel: UILabel!
    
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
        Bundle(for: StatBar.self).loadNibNamed("PokemonTypeView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        contentView.layer.cornerRadius = contentView.bounds.height / 2
    }

    private func loadTypeData() {
        typeIconImageVIew.image = type.icon()
        typeNameLabel.text = type.rawValue.uppercased()
        contentView.backgroundColor = type.color()
    }
}
