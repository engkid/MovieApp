//
//  UserReviewsSection.swift
//  MovieApp
//
//  Created by k1d_dev on 14/08/23.
//

import Foundation

enum UserReviewSection: Int, CaseIterable, Hashable {
    case userReview
}

enum ReviewCellType: Hashable {
    case userReviews(UserReview)
}

struct UserReviewItem: Hashable {
    var identifier: String = UUID().uuidString
    let section: UserReviewSection
    let type: ReviewCellType
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(identifier)
    }
    
    public static func == (lhs: UserReviewItem, rhs: UserReviewItem) -> Bool {
        return lhs.identifier == rhs.identifier
    }
}
