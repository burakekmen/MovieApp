//
//  Movie.swift
//  MovieApp
//
//  Created by Burak Ekmen on 24.08.2024.
//

import Foundation

struct Movie: Codable, Hashable {
    let title: String?
    let year: String?
    let imdbId: String?
    let type: String?
    let poster: String?

    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case imdbId = "imdbID"
        case type = "Type"
        case poster = "Poster"
    }

    // Hashable desteği için imdbId'yi kullanıyoruz
    func hash(into hasher: inout Hasher) {
        hasher.combine(imdbId)
    }

    static func == (lhs: Movie, rhs: Movie) -> Bool {
        return lhs.imdbId == rhs.imdbId
    }
}
