//
//  PokemonStatsTableViewCell.swift
//  Pokedex
//
//  Created by TempUser on 6/17/20.
//  Copyright © 2020 bestcoast. All rights reserved.
//

import UIKit

enum Stat: String {
    case hp, atk, def, satk, sdef, spe
    
    static func stat(for index: Int) -> Stat? {
        switch index {
        case 0: return hp
        case 1: return atk
        case 2: return def
        case 3: return satk
        case 4: return sdef
        case 5: return spe
        default: return nil
        }
    }
}

class PokemonStatsTableViewCell: UITableViewCell {

    @IBOutlet weak var statNameLabel: UILabel!
    @IBOutlet weak var statValueLabel: UILabel!
    @IBOutlet weak var statBar: StatBar!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setup(statIndex: Int, value: Int, fillColor: UIColor) {
        guard let stat = Stat.stat(for: statIndex) else {
            fatalError()
        }
        
        statNameLabel.text = stat.rawValue.uppercased()
        statNameLabel.textColor = fillColor
        
        
        statValueLabel.text = "\(value)"
        
        statBar.fillCurrent = value
        statBar.barFill.backgroundColor = fillColor
    }

}
