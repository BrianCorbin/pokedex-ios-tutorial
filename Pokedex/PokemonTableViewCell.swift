//
//  PokemonTableViewCell.swift
//  Pokedex
//
//  Created by TempUser on 6/14/20.
//  Copyright © 2020 bestcoast. All rights reserved.
//

import UIKit

class PokemonTableViewCell: UITableViewCell {

    @IBOutlet weak var idNumberLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var spriteImageView: UIImageView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var typesStackView: UIStackView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        containerView.layer.cornerRadius = 5
        containerView.layer.shadowColor = UIColor.black.cgColor
        containerView.layer.shadowRadius = 3
        containerView.layer.shadowOffset = CGSize(width: 0, height: 1)
        containerView.layer.shadowOpacity = 0.5
    }
    
    func setup(with pokemon: Pokemon) {
        let formatter = NumberFormatter()
        formatter.minimumIntegerDigits = 3
        
        idNumberLabel.text = "#\(formatter.string(from: NSNumber(value: pokemon.id))!)"
        nameLabel.text = pokemon.name.uppercased()
        spriteImageView.image = UIImage(named: "\(pokemon.id)_sprite")
        containerView.backgroundColor = pokemon.pokedexColor
                
        for view in typesStackView.arrangedSubviews {
            typesStackView.removeArrangedSubview(view)
            view.removeFromSuperview()
        }
        
        for type in pokemon.types {
            let typeView = SimpleTypeView(frame: CGRect(x: 0, y: 0, width: 100, height: 21))
            typeView.type = type
            
            typesStackView.addArrangedSubview(typeView)
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
