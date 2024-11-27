//
//  Recipe.swift
//  demo
//
//  Created by Hanitha Dhavileswarapu on 11/7/24.
//

import Foundation

struct Recipe: Codable, Identifiable {
    
    let id = UUID()
//    var id: ObjectIdentifier
    
    let uuid: String
    let name: String
    let cuisine : String?
    let photo_url_large : String?
    let photo_url_small : String?
    let youtube_url : String?
    
    var url: URL? {
        URL(string: youtube_url!)
       }
}

struct RecipeResponse: Codable {
    let recipes : [Recipe]
}

struct mockData {
    static let sampleData = Recipe( uuid: "123456789", name: "Gulab Jamun", cuisine: "Indian", photo_url_large: "", photo_url_small: "", youtube_url: "")
        
    static let allRecipes = [sampleData, sampleData,sampleData]
}
