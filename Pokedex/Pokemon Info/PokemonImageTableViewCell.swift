//
//  PokemonDetailsImageTableViewCell.swift
//  Pokedex
//
//  Created by TempUser on 6/17/20.
//  Copyright © 2020 bestcoast. All rights reserved.
//

import UIKit

class PokemonImageTableViewCell: UITableViewCell {

    @IBOutlet weak var pokemonImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setup(with pokemon: Pokemon) {
        pokemonImageView.image = UIImage(named: "\(pokemon.id)_main")
        backgroundColor = pokemon.pokedexColor
    }

}
