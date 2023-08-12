//
//  HomeModel.swift
//  MovieApp
//
//  Created by k1d_dev on 11/08/23.
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

enum GenreEndpoint {
    case home
}

extension GenreEndpoint: MovieAPISetup {
    
    var urlEndpoint: URL? {
        switch self {
        case .home:
            if let url = URL(string: "\(AppConstants.basePath)\(endpoint)") {
                return url
            }
            
            return nil
        }
    }
    
    
    private var endpoint: String {
        switch self {
        case .home:
            return "/genre/movie/list"
        }
    }
    
}
