//
//  MovieListModel.swift
//  MovieApp
//
//  Created by k1d_dev on 11/08/23.
//

import Foundation

enum MovieListNavigationOption {
    case movieDetails(Movie)
}

struct Movie: Codable, Hashable, Equatable {
    var identifier: String = UUID().uuidString
    let adult: Bool
    let backdropPath: String?
    let genreIds: [Int]
    let id: Int
    let originalLanguage: String
    let originalTitle: String
    let overview: String
    let popularity: Double
    let posterPath: String?
    let releaseDate: String
    let title: String
    let video: Bool
    let voteAverage: Double
    let voteCount: Int
    
    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case genreIds = "genre_ids"
        case id
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview
        case popularity
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title
        case video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: Movie, rhs: Movie) -> Bool {
        return lhs.id == rhs.id
    }
}

enum MovieListSection: Int, CaseIterable, Hashable {
    case movieList
}

enum MovieListCellType: Hashable {
    case movieList(Movie)
}

struct MovieListItem: Hashable {
    var identifier: String = UUID().uuidString
    let section: MovieListSection
    let type: MovieListCellType
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(identifier)
    }
    
    public static func == (lhs: MovieListItem, rhs: MovieListItem) -> Bool {
        return lhs.identifier == rhs.identifier
    }
}
