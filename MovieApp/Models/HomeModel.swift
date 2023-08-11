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

struct Genres: Hashable {
    let genres: [MovieGenre]
}

struct MovieGenre: Codable, Hashable {
    var id: String = UUID().uuidString
    let movieId: Int
    let name: String
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    public static func == (lhs: MovieGenre, rhs: MovieGenre) -> Bool {
        return lhs.id == rhs.id && lhs.movieId == rhs.movieId
    }
}
