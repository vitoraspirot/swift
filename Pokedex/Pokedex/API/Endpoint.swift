//
//  Endpoint.swift
//  Pokedex
//
//  Created by Vitor Aspirot on 05/08/22.
//

import Foundation

enum Endpoint {
    case pokemonList
    case pokemonDetails(name: String)
    
    var url: String {
        switch self {
        case .pokemonList:
            return "pokemon"
        case .pokemonDetails(let name):
            return "pokemon/\(name)"
        }
    }
}
