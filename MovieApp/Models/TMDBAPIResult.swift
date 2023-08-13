//
//  TMDBAPIResult.swift
//  MovieApp
//
//  Created by Engkit on 13/08/23.
//

import Foundation

struct TMDBApiResult<T: Codable>: Codable {
    let id: Int?
    let page: Int?
    let results: [T]
    let totalPages: Int?
    let totalResults: Int?
    
    enum CodingKeys: String, CodingKey {
        case id, page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}
