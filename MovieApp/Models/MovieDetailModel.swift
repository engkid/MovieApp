//
//  MovieDetailModel.swift
//  MovieApp
//
//  Created by k1d_dev on 13/08/23.
//

import Foundation

enum MovieDetailSection: Int, CaseIterable, Hashable {
    case moviedetail
    case movieTrailer
    case userReview
}

enum MovieDetailCellType: Hashable {
    case movieDetail(Movie)
    case movieTrailer
    case userReviews
}

struct MovieDetailItem: Hashable {
    var identifier: String = UUID().uuidString
    let section: MovieDetailSection
    let type: MovieDetailCellType
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(identifier)
    }
    
    public static func == (lhs: MovieDetailItem, rhs: MovieDetailItem) -> Bool {
        return lhs.identifier == rhs.identifier
    }
}
