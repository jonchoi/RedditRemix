//
//  APIManager.swift
//  RedditRemix
//
//  Created by MD on 10/24/19.
//  Copyright © 2019 Teleport TV. All rights reserved.
//

import Foundation
import SwiftyJSON
import RealmSwift

class APIManager {
    static let sharedInstance = APIManager()

    // We use realm to persist data throughout a session, but we won't be writing to disk for now to keep it simple.
    let realm = try! Realm(configuration: Realm.Configuration(inMemoryIdentifier: "MyInMemoryRealm"))

    // `Results<>` is similar to Array, but can only hold one object type per Realm documentation.
    // https://realm.io/docs/swift/latest#queries
    func getRedditPosts() -> [RedditPost] {
        if isDBEmpty() { initializeDB() }
        let results = realm.objects(RedditPost.self)
        return realmResultToArray(results: results)
    }

    /// Check if Realm is empty.
    private func isDBEmpty() -> Bool {
        return realm.objects(RedditPost.self).isEmpty ? true : false
    }

    /// Initialize Realm DB with static response file.
    private func initializeDB() {
        // Get raw data from static `response.json` file from http://reddit.com/r/wellness/.json
        let url = Bundle.main.url(forResource: "response", withExtension: "json")
        let data = try! Data(contentsOf: url!)
        let json = try! JSON(data: data)
        let jsonPosts = json["data"]["children"]

        // Encode into `RedditPost` objects.
        var posts = [RedditPost]()
        for (_key, subJson) in jsonPosts {
            let data = subJson["data"]
            let post = try! JSONDecoder().decode(RedditPost.self, from: try! data.rawData()) // `Decodable`
            posts.append(post)
        }

        // Store locally in memory for the session.
        try! realm.write {
            realm.add(posts)
        }

        // Show realm objects.
        print(realm.objects(RedditPost.self))
    }

    private func realmResultToArray(results: Results<RedditPost>) -> [RedditPost] {
        var array = [RedditPost]()
        guard results.count != 0 else { return array }
        for result in results {
            array.append(result)
        }
        return array
    }
}
