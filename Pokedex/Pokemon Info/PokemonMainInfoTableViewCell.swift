//
//  PokemonDetailsInfoTableViewCell.swift
//  Pokedex
//
//  Created by TempUser on 6/17/20.
//  Copyright © 2020 bestcoast. All rights reserved.
//

import UIKit

class PokemonMainInfoTableViewCell: UITableViewCell {

    @IBOutlet weak var pokemonIdLabel: UILabel!
    @IBOutlet weak var pokemonNameLabel: UILabel!
    @IBOutlet weak var typesStackView: UIStackView!
    @IBOutlet var typeViews: [PokemonTypeView]!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setup(with pokemon: Pokemon) {
        let numberFormatter = NumberFormatter()
        numberFormatter.minimumIntegerDigits = 3
        
        pokemonIdLabel.text = "#\(numberFormatter.string(from: NSNumber(value: pokemon.id))!)"
        
        pokemonNameLabel.text = pokemon.name.capitalized
        
        for view in typesStackView.arrangedSubviews {
            typesStackView.removeArrangedSubview(view)
            view.removeFromSuperview()
        }
        
        for (index, type) in pokemon.types.enumerated() {
            typesStackView.addArrangedSubview(typeViews[index])
            typeViews[index].type = type
        }
        
    }
}
