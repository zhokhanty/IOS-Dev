//
//  ViewController.swift
//  FavTableView
//
//  Created by Zhalgas Bagytzhan on 21.11.2025.
//

import UIKit

struct FavoriteItem {
    let title: String
    let subtitle: String
    let review: String
    let symbolName: String
    let symbolTintColor: UIColor
}

struct FavoriteSection {
    let title: String
    let icon: String
    let headerColor: UIColor
    let items: [FavoriteItem]
}

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    private var sections: [FavoriteSection] = []
    
    private func configureData() {
        sections = FavoritesDataProvider.sections
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 160
        configureData()
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {

    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: "FavoriteTableViewCell",
            for: indexPath
        ) as? FavoriteTableViewCell else {
            return UITableViewCell()
        }

        let item = sections[indexPath.section].items[indexPath.row]
        cell.configure(with: item)
        return cell
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section].title
    }
}


private enum FavoritesDataProvider {
    static let sections: [FavoriteSection] = [
        FavoriteSection(
            title: "Favorite Movies",
            icon: "🎬",
            headerColor: UIColor.systemIndigo.withAlphaComponent(0.15),
            items: [
                FavoriteItem(
                    title: "Interstellar",
                    subtitle: "Christopher Nolan • 2014",
                    review: "A mind-bending odyssey that balances scientific curiosity with the emotional gravity of family.",
                    symbolName: "sparkles.tv",
                    symbolTintColor: .systemIndigo
                ),
                FavoriteItem(
                    title: "Spirited Away",
                    subtitle: "Hayao Miyazaki • 2001",
                    review: "An enchanting journey through imagination and courage, wrapped in hand-drawn magic.",
                    symbolName: "wind",
                    symbolTintColor: .systemPink
                ),
                FavoriteItem(
                    title: "The Social Network",
                    subtitle: "David Fincher • 2010",
                    review: "Fast-paced storytelling paired with Trent Reznor's haunting score makes this a modern classic.",
                    symbolName: "globe",
                    symbolTintColor: .systemTeal
                ),
                FavoriteItem(
                    title: "Inception",
                    subtitle: "Christopher Nolan • 2010",
                    review: "Multi-layered dreams, brass-heavy soundtrack, and a spinning top that still sparks debate.",
                    symbolName: "brain.head.profile",
                    symbolTintColor: .systemOrange
                ),
                FavoriteItem(
                    title: "La La Land",
                    subtitle: "Damien Chazelle • 2016",
                    review: "Bittersweet romance that celebrates art, sacrifice, and the neon glow of Los Angeles.",
                    symbolName: "music.note.list",
                    symbolTintColor: .systemPurple
                )
            ]
        ),
        FavoriteSection(
            title: "Favorite Music",
            icon: "🎧",
            headerColor: UIColor.systemPink.withAlphaComponent(0.18),
            items: [
                FavoriteItem(
                    title: "Random Access Memories",
                    subtitle: "Daft Punk • 2013",
                    review: "Funky analog grooves and timeless collaborations that make every listen feel like a live session.",
                    symbolName: "headphones",
                    symbolTintColor: .systemPink
                ),
                FavoriteItem(
                    title: "Folklore",
                    subtitle: "Taylor Swift • 2020",
                    review: "Story-driven songwriting layered over atmospheric production; perfect for rainy nights.",
                    symbolName: "leaf",
                    symbolTintColor: .systemGreen
                ),
                FavoriteItem(
                    title: "To Pimp a Butterfly",
                    subtitle: "Kendrick Lamar • 2015",
                    review: "Jazz, funk, and storytelling collide in an album that continues to inspire activism and art.",
                    symbolName: "tortoise",
                    symbolTintColor: .systemBrown
                ),
                FavoriteItem(
                    title: "After Hours",
                    subtitle: "The Weeknd • 2020",
                    review: "Synth-driven nighttime soundtrack with cinematic flair and 80s nostalgia.",
                    symbolName: "moon.stars.fill",
                    symbolTintColor: .systemYellow
                ),
                FavoriteItem(
                    title: "Divide",
                    subtitle: "Ed Sheeran • 2017",
                    review: "Versatile songwriting that jumps between intimate ballads and stadium-ready anthems.",
                    symbolName: "guitars",
                    symbolTintColor: .systemBlue
                )
            ]
        ),
        FavoriteSection(
            title: "Favorite Books",
            icon: "📚",
            headerColor: UIColor.systemGreen.withAlphaComponent(0.16),
            items: [
                FavoriteItem(
                    title: "Sapiens",
                    subtitle: "Yuval Noah Harari",
                    review: "Broadens perspective on humanity's evolution and how stories shape civilizations.",
                    symbolName: "leaf.fill",
                    symbolTintColor: .systemGreen
                ),
                FavoriteItem(
                    title: "Atomic Habits",
                    subtitle: "James Clear",
                    review: "Practical, science-backed framework for building habits that actually stick.",
                    symbolName: "sparkles",
                    symbolTintColor: .systemOrange
                ),
                FavoriteItem(
                    title: "The Midnight Library",
                    subtitle: "Matt Haig",
                    review: "A reflective tale about regret and possibility that feels both cozy and profound.",
                    symbolName: "books.vertical",
                    symbolTintColor: .systemPurple
                ),
                FavoriteItem(
                    title: "Deep Work",
                    subtitle: "Cal Newport",
                    review: "A manual for focus and meaningful output in a distraction-heavy world.",
                    symbolName: "hourglass",
                    symbolTintColor: .systemTeal
                ),
                FavoriteItem(
                    title: "Project Hail Mary",
                    subtitle: "Andy Weir",
                    review: "Hard science fiction with genuine humor and the most endearing alien friendship.",
                    symbolName: "antenna.radiowaves.left.and.right",
                    symbolTintColor: .systemIndigo
                )
            ]
        ),
        FavoriteSection(
            title: "Favorite Courses",
            icon: "🎓",
            headerColor: UIColor.systemOrange.withAlphaComponent(0.16),
            items: [
                FavoriteItem(
                    title: "iOS Development",
                    subtitle: "UIKit & Swift",
                    review: "Hands-on projects that turn design ideas into interactive, polished apps.",
                    symbolName: "iphone",
                    symbolTintColor: .systemBlue
                ),
                FavoriteItem(
                    title: "Data Structures",
                    subtitle: "Algorithms in Swift",
                    review: "Taught me to think critically about performance, memory, and elegant solutions.",
                    symbolName: "shippingbox",
                    symbolTintColor: .systemBrown
                ),
                FavoriteItem(
                    title: "Human-Computer Interaction",
                    subtitle: "Design Thinking",
                    review: "Explores empathy-led design, accessibility, and micro-interactions that delight users.",
                    symbolName: "hand.wave",
                    symbolTintColor: .systemMint
                ),
                FavoriteItem(
                    title: "Database Systems",
                    subtitle: "SQL & Modeling",
                    review: "Showed me how to structure data for reliability while still moving fast.",
                    symbolName: "externaldrive",
                    symbolTintColor: .systemRed
                ),
                FavoriteItem(
                    title: "Machine Learning",
                    subtitle: "Python + Core ML",
                    review: "Demystified model training and gave me tools to add intelligence to everyday apps.",
                    symbolName: "brain",
                    symbolTintColor: .systemPurple
                )
            ]
        )
    ]
}

