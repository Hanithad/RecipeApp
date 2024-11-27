//
//  MockNetworkManger.swift
//  demoTesting
//
//  Created by Hanitha Dhavileswarapu on 11/22/24.


import Foundation
@testable import demo

class MockNetworkManager: NetworkManagerProtocol {
    
    static let shared = MockNetworkManager()
    init() {}
    
    func fetchData(urlRequest: URLRequest, completion : @escaping (Result<Data, NetworkError>) -> Void) {
        
        let bundle = Bundle(for: MockNetworkManager.self)
        
        print("Bundle path: \(bundle.bundlePath)")
        print("Files in bundle: \(try? FileManager.default.contentsOfDirectory(atPath: bundle.bundlePath))")
        guard let url = bundle.url(forResource: "Recipes", withExtension: "json") else {
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
}
