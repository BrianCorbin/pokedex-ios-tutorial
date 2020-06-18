//
//  PokemonTypeWeaknessesTableViewCell.swift
//  Pokedex
//
//  Created by TempUser on 6/17/20.
//  Copyright © 2020 bestcoast. All rights reserved.
//

import UIKit

class PokemonTypeWeaknessesTableViewCell: UITableViewCell {
    
    @IBOutlet var typeWeaknessViews: [TypeWeaknessView]!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setup(with pokemon: Pokemon) {
        for (index, attackType) in Type.all().enumerated() {
            var dmgTakenFromType = 1.0
            for pokemonType in pokemon.types {
                dmgTakenFromType *= pokemonType.damageEffectiveness(from: attackType).rawValue
            }
            
            typeWeaknessViews[index].type = attackType
            typeWeaknessViews[index].damageMultiplier = dmgTakenFromType
        }
    }

}
