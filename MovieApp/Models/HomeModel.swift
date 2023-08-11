//
//  HomeModel.swift
//  MovieApp
//
//  Created by Engkit on 11/08/23.
//

import Foundation

enum HomeSection: Int, CaseIterable, Hashable {
    case genreList
}

enum CellType: Hashable {
    case genreList(MovieGenre)
}

struct HomeItem: Hashable {
    var identifier: String = UUID().uuidString
    let section: HomeSection
    let type: CellType
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(identifier)
    }
    
    public static func == (lhs: HomeItem, rhs: HomeItem) -> Bool {
        return lhs.identifier == rhs.identifier
    }
}

struct Genres: Codable, Hashable {
    let genres: [MovieGenre]
}

struct MovieGenre: Codable, Hashable {
    var identifier: String = UUID().uuidString
    let movieId: Int
    let name: String
    
    enum CodingKeys: String, CodingKey {
        case movieId = "id"
        case name
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(identifier)
    }
    
    public static func == (lhs: MovieGenre, rhs: MovieGenre) -> Bool {
        return lhs.identifier == rhs.identifier && lhs.movieId == rhs.movieId
    }
}
