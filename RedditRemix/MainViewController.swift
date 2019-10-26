//
//  ViewController.swift
//  RedditRemix
//
//  Created by MD on 10/24/19.
//  Copyright © 2019 Teleport TV. All rights reserved.
//

import UIKit

private let cellID = "RedditPostCell"

class MainViewController: UIViewController {

    // MARK: Properties

    var posts = [RedditPost]()

    @IBOutlet var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        posts = APIManager.sharedInstance.getRedditPosts()

        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard posts.count > 0 else { fatalError("Cells being called before datasource") }
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! PostTableViewCell

        // Load data into cell.
        let cellData = posts[indexPath.row]

        cell.author = cellData.author
        cell.thumbnail = cellData.thumbnail

        cell.authorLabel.text = cellData.author
        cell.scoreLabel.text = String(cellData.score)
        cell.titleLabel.text = cellData.title
        cell.body = cellData.body

        // If thumbnail string isn't empty, load image.
        if cellData.thumbnail.count > 0 {
            let thumbnail = cellData.thumbnail
            if let url = URL(string: thumbnail) {
                if let data = try? Data(contentsOf: url) {
                    if let image = UIImage(data: data) {
                        cell.postImageView.image = image
                    }
                }
            }
        }
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        // TODO: Make it dynamic
        return 300
    }
}
