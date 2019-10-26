//
//  RedditPost.swift
//  RedditRemix
//
//  Created by MD on 10/24/19.
//  Copyright © 2019 Teleport TV. All rights reserved.
//

import Foundation

struct RedditPost: Codable {
    var author: String
    var title: String
    var body: String
    var score: Int
    var thumbnail: String

    // TODO: implement model
}

extension RedditPost {
    enum CodingKeys: String, CodingKey {
        case author = "author_fullname"
        case title
        case body = "selftext"
        case score
        case thumbnail
    }
}
