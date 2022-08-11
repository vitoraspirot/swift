//
//  APISupport.swift
//  Pokedex
//
//  Created by Vitor Aspirot on 05/08/22.
//

import Foundation

enum APIError: Error {
    case badUrl(string: String)
    case requestFailed(error: Error)
    case invalidData
    case decodeFailed(error: Error, textData: String?)
}

enum HTTPMethod: String {
    case post
    case `get`
    case delete
}

typealias SuccessResult<T: Decodable> = (T) -> Void
typealias FailureResult = (APIError) -> Void

