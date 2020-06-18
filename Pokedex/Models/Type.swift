//
//  Type.swift
//  Pokedex
//
//  Created by TempUser on 6/16/20.
//  Copyright © 2020 bestcoast. All rights reserved.
//

import Foundation
import UIKit

enum Type: String, Decodable {
    case normal, fighting, flying, poison, ground, rock, bug, ghost, steel, fire, water, grass, electric, psychic, ice, dragon, dark, fairy
    
    func icon() -> UIImage? {
        return UIImage(named: "icon_\(self.rawValue)")
    }
    
    func color() -> UIColor? {
        switch self {
        case .fire: return UIColor(hex: "FF9D55")
        case .bug: return UIColor(hex: "91C22E")
        case .dragon: return UIColor(hex: "0A6DC3")
        case .poison: return UIColor(hex: "AA6BC8")
        case .flying: return UIColor(hex: "8FA9DE")
        case .normal: return UIColor(hex: "919AA2")
        case .fairy: return UIColor(hex: "EC8FE6")
        case .ice: return UIColor(hex: "73CEC0")
        case .steel: return UIColor(hex: "5B8EA2")
        case .dark: return UIColor(hex: "5A5365")
        case .ghost: return UIColor(hex: "5269AD")
        case .psychic: return UIColor(hex: "FA7179")
        case .rock: return UIColor(hex: "C5B78C")
        case .fighting: return UIColor(hex: "CF416A")
        case .ground: return UIColor(hex: "D97845")
        case .water: return UIColor(hex: "5090D5")
        case .grass: return UIColor(hex: "63BC5B")
        case .electric: return UIColor(hex: "F4D23B")
        default:
            return nil
        }
    }
    
    func damageEffectiveness(from attackType: Type) -> Effectiveness {
        return TypeEffectiveness.effectiveness(ofAttackType: attackType, toDefenceType: self)
    }
    
    static func all() -> [Type] {
        return [normal, fighting, flying, poison, ground, rock, bug, ghost, steel, fire, water, grass, electric, psychic, ice, dragon, dark, fairy]
    }
}

enum Effectiveness: Double {
    case none = 0.0, half = 0.5, normal = 1.0, double = 2.0
}
