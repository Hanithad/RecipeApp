//
//  Recipe.swift
//
//  Created by Hanitha Raghava on 11/24/24.
//

import Foundation

struct Recipe: Codable, Identifiable {
    let id = UUID()
    let uuid: String?
    let name: String
    let cuisine : String?
    let photo_url_large : String?
    let photo_url_small : String?
    let youtube_url : String?
}
struct RecipeResponse: Codable {
    let recipes : [Recipe]
}

