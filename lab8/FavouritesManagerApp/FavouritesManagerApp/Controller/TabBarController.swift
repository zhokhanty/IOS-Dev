//
//  TabBarController.swift
//  FavouritesManagerApp
//
//  Created by Zhalgas Bagytzhan on 30.11.2025.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configureAppearance()
        configureShapeAndShadow()
    }

    private func configureAppearance() {
        let appearance = UITabBarAppearance()
        appearance.configureWithTransparentBackground()
        appearance.backgroundEffect = UIBlurEffect(style: .systemMaterial)
        appearance.backgroundColor = UIColor.white.withAlphaComponent(0.22)
        appearance.shadowColor = .clear

        tabBar.standardAppearance = appearance
        if #available(iOS 15.0, *) {
            tabBar.scrollEdgeAppearance = appearance
        }
        tabBar.isTranslucent = true
        tabBar.tintColor = .systemBlue
        tabBar.unselectedItemTintColor = UIColor.label.withAlphaComponent(0.5)
    }

    private func configureShapeAndShadow() {
        tabBar.layer.cornerRadius = 30
        tabBar.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        tabBar.clipsToBounds = false

        tabBar.layer.shadowColor = UIColor.black.cgColor
        tabBar.layer.shadowOpacity = 0.10
        tabBar.layer.shadowRadius = 25
        tabBar.layer.shadowOffset = CGSize(width: 0, height: 6)
        
        additionalSafeAreaInsets.bottom = 10
    }
}

