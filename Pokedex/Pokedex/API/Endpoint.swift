//
//  Endpoint.swift
//  Pokedex
//
//  Created by Vitor Aspirot on 05/08/22.
//

import Foundation

enum Endpoint {
    case pokemon(id: Int)
    
    var url: String {
        switch self {
        case .pokemon(let id):
            return "pokemon/\(id)"
        }
    }
}
