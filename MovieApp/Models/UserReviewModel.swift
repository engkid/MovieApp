//
//  UserReviewModel.swift
//  MovieApp
//
//  Created by Engkit on 13/08/23.
//

import Foundation

struct AuthorDetails: Codable {
    let name, username, avatarPath: String?
    let rating: Double?

    enum CodingKeys: String, CodingKey {
        case name, username, avatarPath = "avatar_path"
        case rating
    }
}

struct UserReview: Codable, Hashable, Equatable {
    let author: String
    let authorDetails: AuthorDetails
    let content, createdAt, id, updatedAt: String
    let url: String

    enum CodingKeys: String, CodingKey {
        case author, content, id, url
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case authorDetails = "author_details"
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: UserReview, rhs: UserReview) -> Bool {
        return lhs.id == rhs.id
    }
}






