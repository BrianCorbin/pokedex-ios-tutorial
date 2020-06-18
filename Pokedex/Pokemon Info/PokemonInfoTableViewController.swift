//
//  PokemonInfoTableViewController.swift
//  Pokedex
//
//  Created by TempUser on 6/17/20.
//  Copyright © 2020 bestcoast. All rights reserved.
//

import UIKit

class PokemonInfoTableViewController: UITableViewController {
    
    var pokemon: Pokemon!

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 4
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        if section == 2 {
            return 6
        }
        
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "image", for: indexPath) as! PokemonImageTableViewCell
            cell.setup(with: pokemon)
            return cell
        }
        
        if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "mainInfo", for: indexPath) as! PokemonMainInfoTableViewCell
            cell.setup(with: pokemon)
            return cell
        }
        
        if indexPath.section == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "stat", for: indexPath) as! PokemonStatsTableViewCell
            cell.setup(statIndex: indexPath.row, value: pokemon.stats[indexPath.row], fillColor: pokemon.pokedexColor)
            return cell
        }
        
        if indexPath.section == 3 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "typeResistances", for: indexPath) as! PokemonTypeWeaknessesTableViewCell
            cell.setup(with: pokemon)
            return cell
        }
        
        fatalError()
    }

}
