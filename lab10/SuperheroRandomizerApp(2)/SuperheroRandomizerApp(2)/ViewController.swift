//
//  ViewController.swift
//  SuperheroRandomizerApp(2)
//
//  Created by Zhalgas Bagytzhan on 09.12.2025.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var hero2ImageView: UIImageView!
    @IBOutlet weak var name2Label: UILabel!
    @IBOutlet weak var randomize2Button: UIButton!
    @IBOutlet weak var activityIndicator2: UIActivityIndicatorView!
    
    private var heroService = HeroService()
    private var currentHero: HeroModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        heroService.delegate = self
        loadSavedHero()
        setupTapGesture()
    }
    
    private func setupUI() {
        hero2ImageView.layer.cornerRadius = 12
        hero2ImageView.clipsToBounds = true
        randomize2Button.layer.cornerRadius = 12
    }
    
    private func setupTapGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(nameTapped))
        name2Label.isUserInteractionEnabled = true
        name2Label.addGestureRecognizer(tapGesture)
    }
        
    @objc private func nameTapped() {
        guard currentHero != nil else { return }
        performSegue(withIdentifier: "showDetail", sender: nil)
    }
    
    @IBAction func randomize2ButtonTapped(_ sender: UIButton) {
        activityIndicator2.startAnimating()
        randomize2Button.isEnabled = false
        heroService.fetchRandomHero()
     }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail",
           let detailVC = segue.destination as? DetailViewController {
            detailVC.hero = currentHero
        }
    }
    
    private func updateUI(with hero: HeroModel) {
        currentHero = hero
        name2Label.text = hero.name
        loadImage(from: hero.images.md)
        saveHero(hero)
        activityIndicator2.stopAnimating()
        randomize2Button.isEnabled = true
    }
    
    private func loadImage(from urlString: String) {
        hero2ImageView.image = UIImage(systemName: "person.circle")
        heroService.fetchImage(from: urlString) { [weak self] data in
            if let data = data, let image = UIImage(data: data) {
                self?.hero2ImageView.image = image
            }
        }
    }
    
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
    
    private func showError(_ message: String) {
        activityIndicator2.stopAnimating()
        randomize2Button.isEnabled = true
        
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        alert.addAction(UIAlertAction(title: "Retry", style: .default) { [weak self] _ in
            self?.randomize2ButtonTapped(self!.randomize2Button)
        })
        present(alert, animated: true)
    }
}

extension ViewController: HeroServiceDelegate {
    func onHeroDidUpdate(model: HeroModel) {
        updateUI(with: model)
    }
    
    func onHeroFetchFailed(error: String) {
        showError(error)
    }
}
