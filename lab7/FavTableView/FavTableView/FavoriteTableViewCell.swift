//
//  FavoriteTableViewCell.swift
//  FavTableView
//
//  Created by Zhalgas Bagytzhan on 22.11.2025.
//


import UIKit

class FavoriteTableViewCell: UITableViewCell {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var reviewLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        containerView.layer.cornerRadius = 12
        containerView.layer.masksToBounds = true

        titleLabel.numberOfLines = 0
        subtitleLabel.numberOfLines = 0
        reviewLabel.numberOfLines = 0

        iconImageView.contentMode = .scaleAspectFit
    }

    func configure(with item: FavoriteItem) {
        titleLabel.text = item.title
        subtitleLabel.text = item.subtitle
        reviewLabel.text = item.review
        iconImageView.image = UIImage(systemName: item.symbolName)
        iconImageView.tintColor = item.symbolTintColor
    }
}
