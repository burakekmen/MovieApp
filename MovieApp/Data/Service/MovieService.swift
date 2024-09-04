//
//  MovieService.swift
//  MovieApp
//
//  Created by Burak Ekmen on 24.08.2024.
//

import Foundation

enum MovieService {
    case getMovies(query: String)
    case getMovieDetail(imdbId: String)
}

extension MovieService: TargetType {
    
    var path: String {
        
        switch self {
            
        case .getMovies(let query):
            return generateEndPoint(lastPath: "s=\(query.trimmingCharacters)")
            
        case .getMovieDetail(let imdbId):
            return generateEndPoint(lastPath: "i=\(imdbId)")
            
        }
        
    }
    
}
