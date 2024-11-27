//
//  NetworkManager.swift
//  demo
//
//  Created by Hanitha Dhavileswarapu on 11/8/24.
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
            if let error = error {
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
        task.resume() //Why is this used?
    }
}
