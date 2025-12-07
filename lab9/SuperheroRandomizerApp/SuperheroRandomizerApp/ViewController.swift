//
//  ViewController.swift
//  SuperheroRandomizerApp
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - IBOutlets
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
    @IBOutlet weak var baseLabel: UILabel!
    @IBOutlet weak var randomizeButton: UIButton!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    // MARK: - Properties
    private var heroService = HeroService()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        heroService.delegate = self
        loadSavedHero()
    }
    
    // MARK: - Setup
    private func setupUI() {
        heroImageView.layer.cornerRadius = 12
        heroImageView.clipsToBounds = true
        randomizeButton.layer.cornerRadius = 12
    }
    
    // MARK: - Actions
    @IBAction func randomizeButtonTapped(_ sender: UIButton) {
        activityIndicator.startAnimating()
        randomizeButton.isEnabled = false
        heroService.fetchRandomHero()
    }
    
    // MARK: - Update UI
    private func updateUI(with hero: HeroModel) {
        nameLabel.text = hero.name
        fullNameLabel.text = hero.biography.fullName
        publisherLabel.text = "Publisher: \(hero.biography.publisher ?? "Unknown")"
        alignmentLabel.text = "Alignment: \(hero.biography.alignment.capitalized)"
        genderLabel.text = "Gender: \(hero.appearance.gender.capitalized)"
        raceLabel.text = "Race: \(hero.appearance.race ?? "Unknown")"
        intelligenceLabel.text = "Intelligence: \(hero.powerstats.intelligence)"
        strengthLabel.text = "Strength: \(hero.powerstats.strength)"
        speedLabel.text = "Speed: \(hero.powerstats.speed)"
        durabilityLabel.text = "Durability: \(hero.powerstats.durability)"
        powerLabel.text = "Power: \(hero.powerstats.power)"
        combatLabel.text = "Combat: \(hero.powerstats.combat)"
        occupationLabel.text = "Occupation: \(hero.work.occupation)"
        baseLabel.text = "Base: \(hero.work.base)"
        
        loadImage(from: hero.images.md)
        saveHero(hero)
        
        activityIndicator.stopAnimating()
        randomizeButton.isEnabled = true
    }
    
    private func loadImage(from urlString: String) {
        heroImageView.image = UIImage(systemName: "person.circle")
        
        heroService.fetchImage(from: urlString) { [weak self] data in
            if let data = data, let image = UIImage(data: data) {
                self?.heroImageView.image = image
            }
        }
    }
    
    // MARK: - Persistence
    private func saveHero(_ hero: HeroModel) {
        if let data = try? PropertyListEncoder().encode(hero) {
            UserDefaults.standard.set(data, forKey: "heroData")
        }
    }
    
    private func loadSavedHero() {
        guard let data = UserDefaults.standard.data(forKey: "heroData"),
              let hero = try? PropertyListDecoder().decode(HeroModel.self, from: data) else {
            return
        }
        updateUI(with: hero)
    }
    
    // MARK: - Error Handling
    private func showError(_ message: String) {
        activityIndicator.stopAnimating()
        randomizeButton.isEnabled = true
        
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        alert.addAction(UIAlertAction(title: "Retry", style: .default) { [weak self] _ in
            self?.randomizeButtonTapped(self?.randomizeButton ?? UIButton())
        })
        present(alert, animated: true)
    }
}

// MARK: - HeroServiceDelegate
extension ViewController: HeroServiceDelegate {
    func onHeroDidUpdate(model: HeroModel) {
        updateUI(with: model)
    }
    
    func onHeroFetchFailed(error: String) {
        showError(error)
    }
}
