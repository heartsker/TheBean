//
//  UIView.swift
//  TheBean
//
//  Created by Alina on 11.02.2022.
//

import UIKit

extension UIViewController {
    func setupAppearance(_ color: UIColor = UIColor(named: "Background") ?? .white,
                         title: String = "Title",
                         tabBarItem: String = "question",
                         tabBarItemColor: UIColor = UIColor(named: "") ?? .black) {
        view.backgroundColor = UIColor(named: "Background")
        self.title = title
        self.tabBarItem.image = UIImage(systemName: tabBarItem)
        self.tabBarItem.standardAppearance?.selectionIndicatorTintColor = tabBarItemColor
    }
    
}
