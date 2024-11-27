//
//  RecipeError.swift
//  demo
//
//  Created by Hanitha Dhavileswarapu on 11/8/24.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
    case unableToComplete
}
