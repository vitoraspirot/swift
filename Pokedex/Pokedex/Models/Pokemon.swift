//
//  Pokemon.swift
//  Pokedex
//
//  Created by Vitor Aspirot on 11/08/22.
//

import Foundation

struct Pokemon: Codable {
    let id: Int
    let name: String
    let types: [SlotOfType]
}
