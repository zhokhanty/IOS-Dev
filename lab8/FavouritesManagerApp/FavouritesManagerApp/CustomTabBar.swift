//
//  CustomTabBar.swift
//  FavouritesManagerApp
//
//  Created by Zhalgas Bagytzhan on 03.12.2025.
//

import UIKit

class CustomTabBar: UITabBar {
    private let customHeight: CGFloat = 90

    override func sizeThatFits(_ size: CGSize) -> CGSize {
        var size = super.sizeThatFits(size)
        size.height = customHeight
        return size
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let extraOffset: CGFloat = -6
        for v in subviews {
            if NSStringFromClass(type(of:v)).contains("UITabBarButton") {
                v.frame = v.frame.offsetBy(dx: 0, dy: extraOffset)
            }
        }
    }
}
