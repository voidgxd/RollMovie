//
//  Movie.swift
//  RollMovie
//
//  Created by Максим Мосалёв on 22.04.2023.
//

import Foundation

// MARK: - Movie
struct Movie: Codable {
    let genres: [Genre]?
    let id: Int?
    let title: String?
    let overview: String?
    let posterPath: String?
    let releaseDate: String?
    let voteAverage: Double?
}

// MARK: - Genre
struct Genre: Codable {
    let name: String?
}

enum CodingKeys: String, CodingKey {
        case genres, id, title
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case voteAverage = "vote_average"
    }
