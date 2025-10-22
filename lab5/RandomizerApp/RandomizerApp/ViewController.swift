//
//  ViewController.swift
//  RandomizerApp
//
//  Created by Zhalgas Bagytzhan on 23.10.2025.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var itemLabel: UILabel!
    @IBOutlet weak var randomizerButton: UIButton!
    
    let favoriteItems: [(name: String, imageName: String)] = [
        ("Eiffel Tower", "eiffel"),
        ("Taj Mahal", "tajmahal"),
        ("Great Wall of China", "greatwall"),
        ("Statue of Liberty", "liberty"),
        ("Colosseum", "colosseum"),
        ("Big Ben", "bigben"),
        ("Machu Picchu", "machupicchu"),
        ("Sydney Opera House", "sydney"),
        ("Christ the Redeemer", "redeemer"),
        ("Pyramids of Giza", "pyramids")
    ]
    
    // Keep reference to dynamic constraint
    private var imageHeightConstraint: NSLayoutConstraint?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupConstraints()
        showRandomItem()
    }
    
    private func setupUI() {
        view.backgroundColor = .systemBackground
        
        // Image style
        itemImageView.contentMode = .scaleAspectFill
        itemImageView.layer.cornerRadius = 16
        itemImageView.clipsToBounds = true
        itemImageView.layer.shadowColor = UIColor.black.cgColor
        itemImageView.layer.shadowOpacity = 0.2
        itemImageView.layer.shadowOffset = CGSize(width: 0, height: 4)
        itemImageView.layer.shadowRadius = 6
        
        // Label style
        itemLabel.textAlignment = .center
        itemLabel.font = UIFont.systemFont(ofSize: 26, weight: .semibold)
        itemLabel.textColor = .label
        itemLabel.numberOfLines = 0
        itemLabel.adjustsFontSizeToFitWidth = true
        itemLabel.minimumScaleFactor = 0.8
        
        // Button style
        randomizerButton.layer.cornerRadius = 12
        randomizerButton.backgroundColor = .systemBlue
        randomizerButton.setTitle("Show Random", for: .normal)
        randomizerButton.setTitleColor(.white, for: .normal)
        randomizerButton.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        randomizerButton.layer.shadowColor = UIColor.black.cgColor
        randomizerButton.layer.shadowOpacity = 0.25
        randomizerButton.layer.shadowOffset = CGSize(width: 0, height: 4)
        randomizerButton.layer.shadowRadius = 5
        
        // Enable Auto Layout
        itemImageView.translatesAutoresizingMaskIntoConstraints = false
        itemLabel.translatesAutoresizingMaskIntoConstraints = false
        randomizerButton.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setupConstraints() {
        let safeArea = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            // ImageView constraints
            itemImageView.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 60),
            itemImageView.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
            itemImageView.widthAnchor.constraint(equalTo: safeArea.widthAnchor, multiplier: 0.7),
            
            // Label constraints
            itemLabel.topAnchor.constraint(equalTo: itemImageView.bottomAnchor, constant: 24),
            itemLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 24),
            itemLabel.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -24),
            
            // Button constraints
            randomizerButton.topAnchor.constraint(equalTo: itemLabel.bottomAnchor, constant: 40),
            randomizerButton.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
            randomizerButton.widthAnchor.constraint(equalTo: safeArea.widthAnchor, multiplier: 0.4),
            randomizerButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        imageHeightConstraint = itemImageView.heightAnchor.constraint(equalTo: safeArea.heightAnchor, multiplier: 0.35)
        imageHeightConstraint?.isActive = true
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        
        coordinator.animate(alongsideTransition: { _ in
            if size.width > size.height {
                self.imageHeightConstraint?.isActive = false
                self.imageHeightConstraint = self.itemImageView.heightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.4)
            } else {
                self.imageHeightConstraint?.isActive = false
                self.imageHeightConstraint = self.itemImageView.heightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.35)
            }
            self.imageHeightConstraint?.isActive = true
            self.view.layoutIfNeeded()
        })
    }
    
    private func showRandomItem() {
        guard let randomItem = favoriteItems.randomElement() else { return }
        
        UIView.transition(with: itemImageView, duration: 0.4, options: .transitionCrossDissolve, animations: {
            self.itemImageView.image = UIImage(named: randomItem.imageName)
        })
        
        itemLabel.text = randomItem.name
    }
    
    @IBAction func randomizeButtonTapped(_ sender: UIButton) {
        showRandomItem()
    }
}
