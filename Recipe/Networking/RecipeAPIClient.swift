//
//  RecipeAPIClient.swift
//
//  Created by Hanitha Raghava on 11/24/24.


import UIKit

class RecipeAPIClient {
   
    init(networkManger: NetworkManagerProtocol = NetworkManager.shared) {
        self.networkManger = networkManger
    }
    static let shared = RecipeAPIClient()
    private let cache = NSCache<NSString, UIImage>()
    var networkManger : NetworkManagerProtocol
    
    func getRecipes(recipeUrl: String,completed: @escaping (Result<[Recipe], NetworkError>) -> Void) {
        guard let url = URL(string: recipeUrl) else {
            return completed(.failure(.invalidURL))
        }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
    
        networkManger.fetchData(urlRequest: urlRequest, completion: { result in
            switch result {
            case .success(let data):
                do {
                    let decoderResponse = try JSONDecoder().decode(RecipeResponse.self, from: data)
                    completed(.success(decoderResponse.recipes))
                } catch{
                    completed(.failure(.invalidData))
                }
            case .failure:
                completed(.failure(.invalidURL))
            }
        })
    }
    
    func downloadImage(fromURLString urlString: String, completed: @escaping(UIImage?) -> Void){
        
        let cacheKey = NSString(string: urlString)
        
        if let image = cache.object(forKey: cacheKey){
            completed(image)
        }
        guard let url = URL(string: urlString) else {
            completed(nil)
            return
        }
        networkManger.fetchData(urlRequest: URLRequest(url: url)){ result in
            switch result {
            case .success(let data):
                guard let image = UIImage(data: data) else {
                    completed(nil)
                    return
                }
                self.cache.setObject(image, forKey: cacheKey)
                completed(image)
            case .failure:
                completed(NetworkError.invalidData as? UIImage)
            }
        }
    }
}

