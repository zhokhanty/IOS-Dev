//
//  DetailViewController.swift
//  FavouritesManagerApp
//
//  Created by Zhalgas Bagytzhan on 30.11.2025.
//

import UIKit

class DetailViewController: UIViewController {

    var item: FavouriteItem!

    private let scrollView = UIScrollView()
    private let contentView = UIView()

    private let itemImageView: UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFit
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()

    private let titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.boldSystemFont(ofSize: 28)
        lbl.numberOfLines = 0
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()

    private let descriptionLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.systemFont(ofSize: 17)
        lbl.numberOfLines = 0
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()

    private let reviewHeader: UILabel = {
        let lbl = UILabel()
        lbl.text = "Your Review"
        lbl.font = UIFont.boldSystemFont(ofSize: 20)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()

    private let reviewLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.systemFont(ofSize: 16)
        lbl.numberOfLines = 0
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupLayout()
        fillContent()
    }

    private func fillContent() {
        itemImageView.image = UIImage(named: item.image)
        titleLabel.text = item.title
        descriptionLabel.text = item.description

        reviewLabel.text = "Rating: \(item.review.rating)/5\n\n\(item.review.text)"
    }
    
    private func setupLayout() {

        view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false

        contentView.addSubview(itemImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(reviewHeader)
        contentView.addSubview(reviewLabel)

        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),

            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),

            itemImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            itemImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            itemImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            itemImageView.heightAnchor.constraint(equalTo: itemImageView.widthAnchor, multiplier: 9.0/16.0),

            titleLabel.topAnchor.constraint(equalTo: itemImageView.bottomAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),

            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
            descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),

            reviewHeader.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 24),
            reviewHeader.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            reviewHeader.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),

            reviewLabel.topAnchor.constraint(equalTo: reviewHeader.bottomAnchor, constant: 8),
            reviewLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            reviewLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            reviewLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -24)
        ])
    }

}
