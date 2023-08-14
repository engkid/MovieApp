//
//  MovieTrailerModel.swift
//  MovieApp
//
//  Created by k1d_dev on 14/08/23.
//

import Foundation

struct MovieTrailer: Codable, Hashable, Equatable {
    let iso6391: String
    let iso31661: String
    let name: String
    let key: String
    let site: String
    let size: Int
    let type: String
    let official: Bool
    let publishedAt: String
    let id: String
    
    enum CodingKeys: String, CodingKey {
        case iso6391 = "iso_639_1"
        case iso31661 = "iso_3166_1"
        case name
        case key
        case site
        case size
        case type
        case official
        case publishedAt = "published_at"
        case id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: MovieTrailer, rhs: MovieTrailer) -> Bool {
        return lhs.id == rhs.id
    }
}
