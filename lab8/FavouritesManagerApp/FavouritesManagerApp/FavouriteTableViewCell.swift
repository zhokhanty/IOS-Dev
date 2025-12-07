//
//  FavouriteTableViewCell.swift
//  FavouritesManagerApp
//
//  Created by Zhalgas Bagytzhan on 27.11.2025.
//

import UIKit

class FavouriteTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imagePageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func configure(with item: FavouriteItem) {
        imagePageView.image = UIImage(named: item.image)
        imagePageView.layer.cornerRadius = 12
        imagePageView.clipsToBounds = true
        titleLabel.text = item.title
    }
    
}
