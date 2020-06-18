//
//  Pokemon.swift
//  Pokedex
//
//  Created by TempUser on 6/15/20.
//  Copyright © 2020 bestcoast. All rights reserved.
//

import Foundation
import UIKit

struct Pokemon: Decodable {
    let id: UInt
    let name: String
    let types: [Type]
    let pokedexColor: UIColor
    let stats: [Int]
    
    enum CodingKeys: CodingKey {
        case id, name, types, pokedexColor, stats
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let id = try container.decode(UInt.self, forKey: .id)
        let name = try container.decode(String.self, forKey: .name)
        let types = try container.decode([Type].self, forKey: .types)
        let pokedexColorHex = try container.decode(String.self, forKey: .pokedexColor)
        let stats = try container.decode([Int].self, forKey: .stats)
        
        self.id = id; self.name = name; self.types = types; self.stats = stats
        self.pokedexColor = UIColor(hex: pokedexColorHex)!
    }
}
