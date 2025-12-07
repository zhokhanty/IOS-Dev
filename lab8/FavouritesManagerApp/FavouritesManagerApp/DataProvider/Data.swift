//
//  Data.swift
//  FavouritesManagerApp
//
//  Created by Zhalgas Bagytzhan on 30.11.2025.
//

import Foundation

class DataProvider {

    static let shared = DataProvider()

    // -----------------------------
    // MARK: - Movies (10)
    // -----------------------------
    let movies: [Movie] = [
        Movie(image: "movie1", title: "The Shawshank Redemption",
              description: "Two imprisoned men bond over years, finding hope and freedom.",
              review: Review(rating: 4.9, text: "Masterpiece."),
              year: 1994, director: "Frank Darabont"),

        Movie(image: "movie2", title: "The Godfather",
              description: "Mafia family struggles between loyalty and power.",
              review: Review(rating: 4.8, text: "Classic crime drama."),
              year: 1972, director: "Francis Ford Coppola"),

        Movie(image: "movie3", title: "The Dark Knight",
              description: "Batman faces the Joker in a psychological battle.",
              review: Review(rating: 4.9, text: "Insanely good."),
              year: 2008, director: "Christopher Nolan"),

        Movie(image: "movie4", title: "Inception",
              description: "A thief infiltrates dreams to plant an idea.",
              review: Review(rating: 4.8, text: "Mind-bending."),
              year: 2010, director: "Christopher Nolan"),

        Movie(image: "movie5", title: "Interstellar",
              description: "Explorers travel through a wormhole to save humanity.",
              review: Review(rating: 4.8, text: "Emotional and epic."),
              year: 2014, director: "Christopher Nolan"),

        Movie(image: "movie6", title: "Forrest Gump",
              description: "A simple man influences major events.",
              review: Review(rating: 4.7, text: "Heartfelt."),
              year: 1994, director: "Robert Zemeckis"),

        Movie(image: "movie7", title: "Avatar",
              description: "A soldier joins the Na’vi on Pandora.",
              review: Review(rating: 4.6, text: "Visual spectacle."),
              year: 2009, director: "James Cameron"),

        Movie(image: "movie8", title: "Gladiator",
              description: "A betrayed general seeks revenge.",
              review: Review(rating: 4.7, text: "Epic story."),
              year: 2000, director: "Ridley Scott"),

        Movie(image: "movie9", title: "Parasite",
              description: "A poor family infiltrates the wealthy Park home.",
              review: Review(rating: 4.9, text: "Brilliant."),
              year: 2019, director: "Bong Joon-ho"),

        Movie(image: "movie10", title: "Whiplash",
              description: "A drummer faces a brutal instructor.",
              review: Review(rating: 4.8, text: "Intense."),
              year: 2014, director: "Damien Chazelle")
    ]


    // -----------------------------
    // MARK: - Music (10)
    // -----------------------------
    let music: [Music] = [
        Music(image: "music1", title: "Bohemian Rhapsody",
              description: "Queen's genre-defying rock opera.",
              review: Review(rating: 4.9, text: "Legendary."),
              artist: "Queen", year: 1975),

        Music(image: "music2", title: "Billie Jean",
              description: "Michael Jackson's iconic pop anthem.",
              review: Review(rating: 4.8, text: "Timeless."),
              artist: "Michael Jackson", year: 1982),

        Music(image: "music3", title: "Lose Yourself",
              description: "Eminem's Oscar-winning motivational rap.",
              review: Review(rating: 4.9, text: "Powerful."),
              artist: "Eminem", year: 2002),

        Music(image: "music4", title: "Shape of You",
              description: "A global pop hit by Ed Sheeran.",
              review: Review(rating: 4.6, text: "Catchy."),
              artist: "Ed Sheeran", year: 2017),

        Music(image: "music5", title: "Take Five",
              description: "Jazz classic with a 5/4 rhythm.",
              review: Review(rating: 4.7, text: "Unique."),
              artist: "Dave Brubeck", year: 1959),

        Music(image: "music6", title: "Blinding Lights",
              description: "Retro-synth pop phenomenon.",
              review: Review(rating: 4.8, text: "Amazing vibe."),
              artist: "The Weeknd", year: 2020),

        Music(image: "music7", title: "Smells Like Teen Spirit",
              description: "Grunge anthem that changed rock.",
              review: Review(rating: 4.8, text: "Raw energy."),
              artist: "Nirvana", year: 1991),

        Music(image: "music8", title: "Hotel California",
              description: "A story told through iconic guitar riffs.",
              review: Review(rating: 4.9, text: "Beautiful."),
              artist: "Eagles", year: 1976),

        Music(image: "music9", title: "Bad Guy",
              description: "Billie Eilish’s minimalist pop hit.",
              review: Review(rating: 4.6, text: "Different and fresh."),
              artist: "Billie Eilish", year: 2019),

        Music(image: "music10", title: "Imagine",
              description: "A message of peace and unity.",
              review: Review(rating: 4.9, text: "Emotional."),
              artist: "John Lennon", year: 1971)
    ]


    // -----------------------------
    // MARK: - Books (10)
    // -----------------------------
    let books: [Book] = [
        Book(image: "book1", title: "1984",
             description: "Dystopian novel on totalitarianism.",
             review: Review(rating: 4.9, text: "Chilling."),
             author: "George Orwell"),

        Book(image: "book2", title: "Harry Potter",
             description: "The beginning of a magical saga.",
             review: Review(rating: 4.8, text: "Beloved classic."),
             author: "J.K. Rowling"),

        Book(image: "book3", title: "To Kill a Mockingbird",
             description: "A story of justice and morality.",
             review: Review(rating: 4.9, text: "Powerful."),
             author: "Harper Lee"),

        Book(image: "book4", title: "The Hobbit",
             description: "Bilbo goes on an unexpected journey.",
             review: Review(rating: 4.8, text: "Magical."),
             author: "J.R.R. Tolkien"),

        Book(image: "book5", title: "Dune",
             description: "A sci-fi epic about politics and prophecy.",
             review: Review(rating: 4.8, text: "Brilliant world-building."),
             author: "Frank Herbert"),

        Book(image: "book6", title: "The Catcher in the Rye",
             description: "Holden Caulfield’s emotional journey.",
             review: Review(rating: 4.6, text: "Meaningful."),
             author: "J.D. Salinger"),

        Book(image: "book7", title: "Pride and Prejudice",
             description: "A classic romance with wit.",
             review: Review(rating: 4.7, text: "Elegant."),
             author: "Jane Austen"),

        Book(image: "book8", title: "The Alchemist",
             description: "A spiritual journey about destiny.",
             review: Review(rating: 4.7, text: "Inspiring."),
             author: "Paulo Coelho"),

        Book(image: "book9", title: "The Great Gatsby",
             description: "A tragic story of wealth and dreams.",
             review: Review(rating: 4.6, text: "Iconic."),
             author: "F. Scott Fitzgerald"),

        Book(image: "book10", title: "Sapiens",
             description: "A story of humankind's evolution.",
             review: Review(rating: 4.9, text: "Mind-opening."),
             author: "Yuval Noah Harari")
    ]


    // -----------------------------
    // MARK: - Courses (10)
    // -----------------------------
    let courses: [Course] = [
        Course(image: "course1", title: "iOS Development",
               description: "Learn Swift, UIKit, and app building.",
               review: Review(rating: 4.9, text: "Perfect for beginners."),
               tutor: "John Smith", platform: "Udemy"),

        Course(image: "course2", title: "Web Development Bootcamp",
               description: "HTML, CSS, JS, React, Node.js.",
               review: Review(rating: 4.8, text: "Complete program."),
               tutor: "Angela Yu", platform: "Udemy"),

        Course(image: "course3", title: "Python for Data Science",
               description: "Pandas, NumPy, ML basics.",
               review: Review(rating: 4.8, text: "Very practical."),
               tutor: "Jose Portilla", platform: "Coursera"),

        Course(image: "course4", title: "Machine Learning A–Z",
               description: "Supervised & unsupervised learning.",
               review: Review(rating: 4.8, text: "Great explanations."),
               tutor: "Kirill Eremenko", platform: "Udemy"),

        Course(image: "course5", title: "UI/UX Design",
               description: "Learn Figma, grids, typography.",
               review: Review(rating: 4.7, text: "Very visual."),
               tutor: "Daniel Walter Scott", platform: "Skillshare"),

        Course(image: "course6", title: "Digital Marketing",
               description: "SEO, Ads, analytics.",
               review: Review(rating: 4.6, text: "Useful for businesses."),
               tutor: "Rob Percival", platform: "Udemy"),

        Course(image: "course7", title: "Cybersecurity Basics",
               description: "Protect networks and data.",
               review: Review(rating: 4.8, text: "Must-learn."),
               tutor: "IBM Team", platform: "Coursera"),

        Course(image: "course8", title: "Blockchain Fundamentals",
               description: "Crypto, smart contracts, web3.",
               review: Review(rating: 4.7, text: "Explains clearly."),
               tutor: "Andrew Wong", platform: "edX"),

        Course(image: "course9", title: "Statistics for ML",
               description: "Distributions, regression, metrics.",
               review: Review(rating: 4.7, text: "Very helpful."),
               tutor: "MIT Team", platform: "edX"),

        Course(image: "course10", title: "Entrepreneurship 101",
               description: "Launching startups and MVPs.",
               review: Review(rating: 4.6, text: "Motivating."),
               tutor: "Harvard Staff", platform: "edX")
    ]
}

