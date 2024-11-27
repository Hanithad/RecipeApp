//
//  RecipeAPIClient.swift
//  demo
//
//  Created by Hanitha Dhavileswarapu on 11/13/24.


import UIKit

class RecipeAPIClient {
   
    //private let apiService: APIService
    
    //created a dependency injection so we can test it in test cases 
//    init(apiService: APIService = NetworkManager.shared) {
//        self.apiService = apiService
//    }
    //created singleton - create once used in the entire app
    static let shared = RecipeAPIClient()
    private let cache = NSCache<NSString, UIImage>()
    static let baseURL = "https://d3jbb8n5wk0qxi.cloudfront.net"
    private let recipeURL = baseURL + "/recipes.json"
    
    var networkManger : NetworkManagerProtocol?
    
     //init() {}
    
    func getRecipes(completed: @escaping (Result<[Recipe], NetworkError>) -> Void) {
        var urlRequest = URLRequest(url: URL(string: recipeURL)!)
        urlRequest.httpMethod = "GET"
    
        networkManger?.fetchData(urlRequest: urlRequest, completion: { result in
            switch result {
            case .success(let data):
                do {
                    let decoderResponse = try JSONDecoder().decode(RecipeResponse.self, from: data)
                    //print("Decoded response \(decoderResponse)")
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
            return
        }
        guard let url = URL(string: urlString) else {
            completed(nil)
            return
        }
        //        let task = URLSession.shared.dataTask(with: url) { data, response, error in
        //
        //            guard let image = UIImage(data: data) else {
        //                completed(nil)
        //                return
        //            }
        //            self.cache.setObject(image, forKey: cacheKey)
        //            completed(image)
        //        }
               // task.resume()
        
        NetworkManager.shared.fetchData(urlRequest: URLRequest(url: url)) { result in
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

/*
 
 func getRecipes(completed: @escaping (Result<[Recipe], RecipeError>) -> Void) {
     
     guard let url = URL(string: RecipeAPIClient.baseURL) else {
         return completed(.failure(.invalidURL))
     }
     
     let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
         
         //data , response and error - are optionals so unwrap the optionals -
         if let _ = error  {
             completed(.failure(.unableToComplete))
             
         }
         guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
             completed(.failure(.invalidResponse))
             return
         }
         guard let data = data else {
             completed(.failure(.invalidData))
             return
         }
         
         do {
             let decoderResponse = try JSONDecoder().decode(RecipeResponse.self, from: data)
             print("Decoded response \(decoderResponse)")
             completed(.success(decoderResponse.recipes))
         } catch{
             completed(.failure(.invalidData))
         }
     }
     task.resume()
 }
 */
