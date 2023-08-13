//
//  MovieDetailEndpoints.swift
//  MovieApp
//
//  Created by Engkit on 13/08/23.
//

import Foundation

enum MovieDetailEndpoint {
    case userReview(String)
    case movieTrailer(String)
}

extension MovieDetailEndpoint: MovieAPISetup {
    
    var urlEndpoint: URL? {
        return URL(string: "\(AppConstants.basePath)\(endpoint)")
    }
    
    private var endpoint: String {
        switch self {
        case .userReview(let movieId):
            return "/movie/\(movieId)/reviews"
        case .movieTrailer(let movieId):
            return "/movie/\(movieId)/videos"
        }
    }
    
}
