//
//  NetworkManager.swift
//
//  Created by Hanitha Raghava on 11/24/24.
//

import Foundation

protocol NetworkManagerProtocol {
    func fetchData(urlRequest: URLRequest, completion : @escaping (Result<Data, NetworkError>) -> Void)
}

class NetworkManager: NetworkManagerProtocol {
    
    static let shared = NetworkManager()
    init() {}
    
    func fetchData(urlRequest: URLRequest, completion : @escaping (Result<Data, NetworkError>) -> Void) {
        
        let task = URLSession.shared.dataTask(with: urlRequest) {  data, response, error in
            if error != nil {
                completion(.failure(NetworkError.invalidResponse))
                return
            }
            guard let data = data else {
                completion(.failure(NetworkError.invalidData))
                return
            }
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completion(.failure(NetworkError.invalidResponse))
                return
            }
            completion(.success(data))
        }
        task.resume()
    }
}
