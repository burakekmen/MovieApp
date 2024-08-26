//
//  Client.swift
//  MovieApp
//
//  Created by Burak Ekmen on 24.08.2024.
//

import Foundation

class Client {
    
    func searchMovies(query: String, completion: @escaping (Result<SearchResult?, ClientError>) -> Void) {
        
    }
    
}


enum ClientError: Error {
    case wrongUrl
    case dataNotReceived
    case dataProcessingFailed
}
