//
//  MovieDetail.swift
//  MovieApp
//
//  Created by Burak Ekmen on 4.09.2024.
//

import Foundation

struct MovieDetail: Codable {
    let title: String?
    let year: String?
    let genre: String?
    let director: String?
    let poster: String?
    let imdbId: String?
    let imdbRating: String?
    let plot: String?
    let runtime: String?
    
    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case genre = "Genre"
        case director = "Director"
        case imdbId = "imdbID"
        case imdbRating = "imdbRating"
        case poster = "Poster"
        case plot = "Plot"
        case runtime = "Runtime"
    }
}
