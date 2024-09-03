//
//  SearchResult.swift
//  MovieApp
//
//  Created by Burak Ekmen on 24.08.2024.
//

import Foundation

struct SearchResult : Codable {
    let movies: [Movie]?
    
    enum CodingKeys: String, CodingKey {
        case movies = "Search"
        
    }
}
