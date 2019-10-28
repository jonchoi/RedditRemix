//
//  RedditPost.swift
//  RedditRemix
//
//  Created by MD on 10/24/19.
//  Copyright © 2019 Teleport TV. All rights reserved.
//

import Foundation
import RealmSwift

// Implemented as a class for Realm.
class RedditPost: Object, Codable {
    // @objc dynamic for Realm.
    // More on working with Realm objects: https://realm.io/docs/swift/latest#working-with-realm-objects
    @objc dynamic var id: String
    @objc dynamic var author: String
    @objc dynamic var title: String
    @objc dynamic var body: String
    @objc dynamic var score: Int
    @objc dynamic var thumbnail: String

    override static func primaryKey() -> String? {
        return "id"
    }

    // Feel free to extend implementation.
}

extension RedditPost {
    enum CodingKeys: String, CodingKey {
        case id
        case author
        case title
        case body = "selftext"
        case score
        case thumbnail
    }
}
