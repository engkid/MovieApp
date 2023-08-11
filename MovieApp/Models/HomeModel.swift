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
    let identifier: String = UUID().uuidString
    let section: HomeSection
    let type: CellType
}

struct Genres: Hashable {
    let genres: [MovieGenre]
}

struct MovieGenre: Hashable {
    let id: String = UUID().uuidString
    let movieId: Int
    let name: String
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    public static func == (lhs: MovieGenre, rhs: MovieGenre) -> Bool {
        return lhs.id == rhs.id && lhs.movieId == rhs.movieId
    }
}
