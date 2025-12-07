//
//  ItemModel.swift
//  FavouritesManagerApp
//
//  Created by Zhalgas Bagytzhan on 26.11.2025.
//
struct Review {
    var rating: Double
    var text: String
}
protocol FavouriteItem {
    var image: String { get }
    var title: String { get }
    var description: String { get }
    var review: Review { get }
}

struct Movie: FavouriteItem {
    var image: String
    var title: String
    var description: String
    var review: Review
    var year: Int
    var director: String
}
struct Music: FavouriteItem {
    var image: String
    var title: String
    var description: String
    var review: Review
    var artist: String
    var year: Int
}
struct Book: FavouriteItem {
    var image: String
    var title: String
    var description: String
    var review: Review
    var author: String
}
struct Course: FavouriteItem {
    var image: String
    var title: String
    var description: String
    var review: Review
    var tutor: String
    var platform: String
}
