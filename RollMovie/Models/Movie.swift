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
    let poster_path: String?
    let release_date: String?
    let voteAverage: Double?
}

// MARK: - Genre
struct Genre: Codable {
//    let id: Int?
    let name: String?
}

//enum CodingKeys: String, CodingKey {
//        case genres
//        case id
//        case title
//        case overview
//        case posterPath = "poster_path"
//        case releaseDate = "release_date"
//        case voteAverage = "vote_average"
//    }
