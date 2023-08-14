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
