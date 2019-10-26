//
//  PostTableViewCell.swift
//  RedditRemix
//
//  Created by MD on 10/24/19.
//  Copyright © 2019 Teleport TV. All rights reserved.
//

import UIKit

///
class PostTableViewCell: UITableViewCell {

    // MARK: Properties

    var author: String?
    var body: String?
    var thumbnail: String?
    var upvotes: Int?

    // MARK: Outlets

    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var authorLabel: UILabel!
    @IBOutlet var postImageView: UIImageView!
    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var upvoteButton: UIButton!
    @IBOutlet var downvoteButton: UIButton!

    // MARK: UITableViewCell

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
