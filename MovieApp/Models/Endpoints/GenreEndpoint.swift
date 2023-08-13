//
//  GenreEndpoint.swift
//  MovieApp
//
//  Created by Engkit on 13/08/23.
//

import Foundation

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
