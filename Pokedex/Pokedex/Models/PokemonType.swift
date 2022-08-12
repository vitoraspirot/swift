//
//  PokemonType.swift
//  Pokedex
//
//  Created by Vitor Aspirot on 12/08/22.
//

import Foundation
import UIKit

enum PokeType: String, Codable {
    case normal
    case fighting
    case flying
    case poison
    case ground
    case rock
    case bug
    case ghost
    case steel
    case fire
    case water
    case grass
    case electric
    case psychic
    case ice
    case dragon
    case dark
    case fairy
    
    var primaryColor: UIColor {
        switch self {
        case .normal:
            return Colors.normal_primary()!
        case .fighting:
            return Colors.fighting_primary()!
        case .flying:
            return Colors.flying_primary()!
        case .poison:
            return Colors.poison_primary()!
        case .ground:
            return Colors.ground_primary()!
        case .rock:
            return Colors.rock_primary()!
        case .bug:
            return Colors.bug_primary()!
        case .ghost:
            return Colors.ghost_primary()!
        case .steel:
            return Colors.steel_primary()!
        case .fire:
            return Colors.fire_primary()!
        case .water:
            return Colors.water_primary()!
        case .grass:
            return Colors.grass_primary()!
        case .electric:
            return Colors.electric_primary()!
        case .psychic:
            return Colors.psychic_primary()!
        case .ice:
            return Colors.ice_primary()!
        case .dragon:
            return Colors.dragon_primary()!
        case .dark:
            return Colors.dark_primary()!
        case .fairy:
            return Colors.fairy_primary()!
        }
    }
    
   
}

struct PokemonType: Codable {
    let name: PokeType
}
