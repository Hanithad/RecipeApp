//
//  MockNetworkManger.swift
//
//  Created by Hanitha Raghava on 11/24/24.


import Foundation
@testable import RecipeApp
import UIKit

class MockNetworkManager: NetworkManagerProtocol {
    
    static let shared = MockNetworkManager()
    init() {}
    
    func fetchData(urlRequest: URLRequest, completion : @escaping (Result<Data, NetworkError>) -> Void) {
        guard let url = getMockFileURL(urlRequest: urlRequest) else {
            completion(.failure(NetworkError.invalidResponse))
            return
        }
        do{
            let data = try Data(contentsOf: url)
            completion(.success(data))
        }
        catch{
            completion(.failure(NetworkError.invalidResponse))
        }
    }
    
    func getMockFileURL(urlRequest: URLRequest) -> URL? {
        
        let bundle = Bundle(for: MockNetworkManager.self)
        let resourcePath = getFilePathForURL(urlPath: urlRequest.url?.absoluteString ?? "")
        let pathArray = resourcePath.components(separatedBy: ".")
        guard pathArray.count>1, let url = bundle.url(forResource: pathArray[0], withExtension: pathArray[1]) else {
            
            return URL(string: " ")
            
        }
        return url
    }
    
    func getFilePathForURL(urlPath: String) -> String {
        print("urlPath requested is \(urlPath)")
        switch urlPath {
        case "https://d3jbb8n5wk0qxi.cloudfront.net/recipes.json":
            return "Recipes.json"
        case "https://d3jbb8n5wk0qxi.cloudfront.net/photos/b9ab0071-b281-4bee-b361-ec340d405320/small.jpg":
            return "small.jpg"
        case "https://d3jbb8n5wk0qxi.cloudfront.net/recipes-malformed.json":
            return "Recipes-malformed.json"
        case "https://d3jbb8n5wk0qxi.cloudfront.net/recipes-empty.json":
            return ""
        default:
            return ""
        }
    }
}
