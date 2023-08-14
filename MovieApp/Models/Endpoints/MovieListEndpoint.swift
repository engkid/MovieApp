//
//  MovieListEndpoint.swift
//  MovieApp
//
//  Created by k1d_dev on 13/08/23.
//

import Foundation

enum MovieListEndpoint {
    case movieList
}

extension MovieListEndpoint: MovieAPISetup {
    
    var urlEndpoint: URL? {
        switch self {
        case .movieList:
            return URL(string: "\(AppConstants.basePath)\(endpoint)")
        }
    }
    
    private var endpoint: String {
        switch self {
        case .movieList:
            return "/discover/movie"
        }
    }
}
