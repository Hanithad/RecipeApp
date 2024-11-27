//
//  RecipeError.swift
//
//  Created by Hanitha Raghava on 11/24/24.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
    case unableToComplete
    case noData
}
