//
//  APIManager.swift
//  RedditRemix
//
//  Created by MD on 10/24/19.
//  Copyright © 2019 Teleport TV. All rights reserved.
//

import Foundation
import SwiftyJSON

class APIManager {
    static let sharedInstance = APIManager()

    ///
    func getRedditPosts() -> [RedditPost] {

        // MARK: Could remove and ask how to deserialize JSON?

        // Here's some static data from "response.json" file that represents a subreddit.
        // http://reddit.com/r/wellness/.json
        let url = Bundle.main.url(forResource: "response", withExtension: "json")
        let data = try! Data(contentsOf: url!)
        let json = try! JSON(data: data)
        let posts = json["data"]["children"]

        var encodedPosts = [RedditPost]()
        for (_key, subJson) in posts {
            let data = subJson["data"]
            let post = try! JSONDecoder().decode(RedditPost.self, from: try! data.rawData()) // `Decodable`
            encodedPosts.append(post)
        }
        return encodedPosts
    }
}
