//
//  DetailViewController.swift
//  SuperheroRandomizerApp(2)
//
//  Created by Zhalgas Bagytzhan on 09.12.2025.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var heroImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var publisherLabel: UILabel!
    @IBOutlet weak var alignmentLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var raceLabel: UILabel!
    @IBOutlet weak var intelligenceLabel: UILabel!
    @IBOutlet weak var strengthLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    @IBOutlet weak var durabilityLabel: UILabel!
    @IBOutlet weak var powerLabel: UILabel!
    @IBOutlet weak var combatLabel: UILabel!
    @IBOutlet weak var occupationLabel: UILabel!
    
    @IBOutlet var statValueLabels: [UILabel]!
    @IBOutlet var statProgressViews: [UIProgressView]!
        
    var hero: HeroModel?
    private let heroService = HeroService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
        if let hero = hero {
            updateUI(with: hero)
        }
    }
    
    private func setupUI() {
        heroImageView.layer.cornerRadius = 12
        heroImageView.clipsToBounds = true
        
        statProgressViews.forEach { bar in
            bar.progress = 0
            bar.trackTintColor = .lightGray
        }
    }
    
    private func updateUI(with hero: HeroModel) {
        nameLabel.text = hero.name
        fullNameLabel.text = hero.biography.fullName
        publisherLabel.text = "Publisher: \(hero.biography.publisher ?? "Unknown")"
        alignmentLabel.text = "Alignment: \(hero.biography.alignment.capitalized)"
        genderLabel.text = "Gender: \(hero.appearance.gender.capitalized)"
        raceLabel.text = "Race: \(hero.appearance.race ?? "Unknown")"
        occupationLabel.text = "Occupation: \(hero.work.occupation)"
        intelligenceLabel.text = "Intelligence:"
        strengthLabel.text = "Strength:"
        speedLabel.text = "Speed:"
        durabilityLabel.text = "Durability:"
        powerLabel.text = "Power:"
        combatLabel.text = "Combat:"
        
        let stats = [
            hero.powerstats.intelligence,
            hero.powerstats.strength,
            hero.powerstats.speed,
            hero.powerstats.durability,
            hero.powerstats.power,
            hero.powerstats.combat
        ]
        updateAllStats(stats: stats)
        loadImage(from: hero.images.md)
    }
    
    private func loadImage(from urlString: String) {
        heroImageView.image = UIImage(systemName: "person.circle")
        
        heroService.fetchImage(from: urlString) { [weak self] data in
            if let data = data, let image = UIImage(data: data) {
                self?.heroImageView.image = image
            }
        }
    }
        
    func updateAllStats(stats: [Int]) {
        for (index, value) in stats.enumerated() {
            guard index < statValueLabels.count, index < statProgressViews.count else { continue }
            
            let valueLabel = statValueLabels[index]
            let bar = statProgressViews[index]
            
            valueLabel.text = "\(value)"
            
            let progress = max(0, min(100, value))
            bar.setProgress(Float(progress) / 100.0, animated: true)
            
            switch progress {
            case 0...30:
                bar.progressTintColor = .systemRed
            case 31...70:
                bar.progressTintColor = .systemYellow
            default:
                bar.progressTintColor = .systemGreen
            }
            
            bar.trackTintColor = .systemGray4
        }
    }
}


