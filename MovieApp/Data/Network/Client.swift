//
//  Client.swift
//  MovieApp
//
//  Created by Burak Ekmen on 24.08.2024.
//

import Foundation

class Client {
    
    func requestRestApi<T: Codable>(endpoint: String, completion: @escaping (Result<T?, ClientError>) -> Void) {
        
        guard let url = URL(string: endpoint) else {
            completion(.failure(.wrongUrl))
            return
        }
        
        URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
            guard let data, error == nil else {
                completion(.failure(.dataNotReceived))
                return
            }
            
            guard let response = try? JSONDecoder().decode(T.self, from: data) else {
                completion(.failure(.dataProcessingFailed))
                return
            }
            
            completion(.success(response))
            
        }).resume()
    }
    
    
}


enum ClientError: Error {
    case wrongUrl
    case dataNotReceived
    case dataProcessingFailed
}
