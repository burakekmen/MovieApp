//
//  MovieService.swift
//  MovieApp
//
//  Created by Burak Ekmen on 24.08.2024.
//

import Foundation

enum MovieService {
    case getMovies(query: String)
}

extension MovieService: TargetType {
    
    var path: String {
        
        switch self {
            
        case .getMovies(let query):
            return generateEndPoint(lastPath: "&s=\(query)")
            
        }
        
    }
    
}
