//
//  PokedexTableViewController.swift
//  Pokedex
//
//  Created by TempUser on 6/15/20.
//  Copyright © 2020 bestcoast. All rights reserved.
//

import UIKit

class PokedexTableViewController: UITableViewController {
    
    private var pokemonList = [Pokemon]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadPokemon()

    }
    
    private func loadPokemon() {
        let fileUrl = Bundle.main.url(forResource: "pokemon", withExtension: "json")!
        let pokemonData = try! Data(contentsOf: fileUrl)
        pokemonList = try! JSONDecoder().decode([Pokemon].self, from: pokemonData)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let tableViewCell = sender as? UITableViewCell, let indexPathOfCell = tableView.indexPath(for: tableViewCell), let pokemonInfoViewController = segue.destination as? PokemonInfoTableViewController {
            pokemonInfoViewController.pokemon = pokemonList[indexPathOfCell.row]
        }
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return pokemonList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "pokemonCell", for: indexPath) as! PokemonTableViewCell
        
        cell.setup(with: pokemonList[indexPath.row])
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
