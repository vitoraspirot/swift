//
//  PokemonList.swift
//  Pokedex
//
//  Created by Vitor Aspirot on 04/08/22.
//

import Foundation

struct PokemonListResponse: Codable {
    let results: [ListedPokemonResponse]
}
