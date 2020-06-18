//
//  TypeEffectiveness.swift
//  Pokedex
//
//  Created by TempUser on 6/17/20.
//  Copyright © 2020 bestcoast. All rights reserved.
//

import Foundation

class TypeEffectiveness {
    static private let effectivenessTable: [Type : [Type : Effectiveness]] = [
        .normal: [.normal : .normal, .fighting : .normal, .flying: .normal, .poison: .normal, .ground: .normal, .rock: .half, .bug: .normal, .ghost: .none, .steel: .half, .fire: .normal, .water: .normal, .grass: .normal, .electric: .normal, .psychic: .normal, .ice: .normal, .dragon: .normal, .dark: .normal, .fairy: .normal],
        .fighting: [.normal : .double, .fighting : .normal, .flying: .half, .poison: .half, .ground: .normal, .rock: .double, .bug: .half, .ghost: .none, .steel: .double, .fire: .normal, .water: .normal, .grass: .normal, .electric: .normal, .psychic: .half, .ice: .double, .dragon: .normal, .dark: .double, .fairy: .half],
        .flying: [.normal : .normal, .fighting : .double, .flying: .normal, .poison: .normal, .ground: .normal, .rock: .half, .bug: .double, .ghost: .normal, .steel: .half, .fire: .normal, .water: .normal, .grass: .double, .electric: .half, .psychic: .normal, .ice: .normal, .dragon: .normal, .dark: .normal, .fairy: .normal],
        .poison: [.normal : .normal, .fighting : .normal, .flying: .normal, .poison: .half, .ground: .half, .rock: .half, .bug: .normal, .ghost: .half, .steel: .none, .fire: .normal, .water: .normal, .grass: .double, .electric: .normal, .psychic: .normal, .ice: .normal, .dragon: .normal, .dark: .normal, .fairy: .double],
        .ground: [.normal : .normal, .fighting : .normal, .flying: .none, .poison: .double, .ground: .normal, .rock: .double, .bug: .half, .ghost: .normal, .steel: .double, .fire: .double, .water: .normal, .grass: .half, .electric: .double, .psychic: .normal, .ice: .normal, .dragon: .normal, .dark: .normal, .fairy: .normal],
        .rock: [.normal : .normal, .fighting : .half, .flying: .double, .poison: .normal, .ground: .half, .rock: .normal, .bug: .double, .ghost: .normal, .steel: .half, .fire: .double, .water: .normal, .grass: .normal, .electric: .normal, .psychic: .normal, .ice: .double, .dragon: .normal, .dark: .normal, .fairy: .normal],
        .bug: [.normal : .normal, .fighting : .half, .flying: .half, .poison: .half, .ground: .normal, .rock: .normal, .bug: .normal, .ghost: .half, .steel: .half, .fire: .half, .water: .normal, .grass: .double, .electric: .normal, .psychic: .double, .ice: .normal, .dragon: .normal, .dark: .double, .fairy: .half],
        .ghost: [.normal : .none, .fighting : .normal, .flying: .normal, .poison: .normal, .ground: .normal, .rock: .normal, .bug: .normal, .ghost: .double, .steel: .normal, .fire: .normal, .water: .normal, .grass: .normal, .electric: .normal, .psychic: .double, .ice: .normal, .dragon: .normal, .dark: .half, .fairy: .normal],
        .steel: [.normal : .normal, .fighting : .normal, .flying: .normal, .poison: .normal, .ground: .normal, .rock: .double, .bug: .normal, .ghost: .normal, .steel: .half, .fire: .half, .water: .half, .grass: .normal, .electric: .half, .psychic: .normal, .ice: .double, .dragon: .normal, .dark: .normal, .fairy: .double],
        .fire: [.normal : .normal, .fighting : .normal, .flying: .normal, .poison: .normal, .ground: .normal, .rock: .half, .bug: .double, .ghost: .normal, .steel: .double, .fire: .half, .water: .half, .grass: .double, .electric: .normal, .psychic: .normal, .ice: .double, .dragon: .half, .dark: .normal, .fairy: .normal],
        .water: [.normal : .normal, .fighting : .normal, .flying: .normal, .poison: .normal, .ground: .double, .rock: .double, .bug: .normal, .ghost: .normal, .steel: .normal, .fire: .double, .water: .half, .grass: .half, .electric: .normal, .psychic: .normal, .ice: .normal, .dragon: .half, .dark: .normal, .fairy: .normal],
        .grass: [.normal : .normal, .fighting : .normal, .flying: .half, .poison: .half, .ground: .double, .rock: .double, .bug: .half, .ghost: .normal, .steel: .half, .fire: .half, .water: .double, .grass: .half, .electric: .normal, .psychic: .normal, .ice: .normal, .dragon: .half, .dark: .normal, .fairy: .normal],
        .electric: [.normal : .normal, .fighting : .normal, .flying: .double, .poison: .normal, .ground: .none, .rock: .normal, .bug: .normal, .ghost: .normal, .steel: .normal, .fire: .normal, .water: .double, .grass: .half, .electric: .half, .psychic: .normal, .ice: .normal, .dragon: .half, .dark: .normal, .fairy: .normal],
        .psychic: [.normal : .normal, .fighting : .double, .flying: .normal, .poison: .double, .ground: .normal, .rock: .normal, .bug: .normal, .ghost: .normal, .steel: .half, .fire: .normal, .water: .normal, .grass: .normal, .electric: .normal, .psychic: .half, .ice: .normal, .dragon: .normal, .dark: .none, .fairy: .normal],
        .ice: [.normal : .normal, .fighting : .normal, .flying: .double, .poison: .normal, .ground: .double, .rock: .normal, .bug: .normal, .ghost: .normal, .steel: .half, .fire: .half, .water: .half, .grass: .double, .electric: .normal, .psychic: .normal, .ice: .half, .dragon: .double, .dark: .normal, .fairy: .normal],
        .dragon: [.normal : .normal, .fighting : .normal, .flying: .normal, .poison: .normal, .ground: .normal, .rock: .normal, .bug: .normal, .ghost: .normal, .steel: .half, .fire: .normal, .water: .normal, .grass: .normal, .electric: .normal, .psychic: .normal, .ice: .normal, .dragon: .double, .dark: .normal, .fairy: .none],
        .dark: [.normal : .normal, .fighting : .half, .flying: .normal, .poison: .normal, .ground: .normal, .rock: .normal, .bug: .normal, .ghost: .double, .steel: .normal, .fire: .normal, .water: .normal, .grass: .normal, .electric: .normal, .psychic: .double, .ice: .normal, .dragon: .normal, .dark: .half, .fairy: .half],
        .fairy: [.normal : .normal, .fighting : .double, .flying: .normal, .poison: .half, .ground: .normal, .rock: .normal, .bug: .normal, .ghost: .normal, .steel: .half, .fire: .half, .water: .normal, .grass: .normal, .electric: .normal, .psychic: .normal, .ice: .normal, .dragon: .double, .dark: .double, .fairy: .normal]
    ]
    
    static func effectiveness(ofAttackType attackType: Type, toDefenceType defenceType: Type) -> Effectiveness {
        return self.effectivenessTable[attackType]![defenceType]!
    }
}
