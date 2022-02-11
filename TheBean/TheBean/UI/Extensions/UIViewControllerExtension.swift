//
//  UIView.swift
//  TheBean
//
//  Created by Alina on 11.02.2022.
//

import UIKit

extension UIViewController {
    func setupAppearance(title: String = "Title",
                         tabBarItem: String = "question") {
        view.backgroundColor = UIColor(named: "Background")
        self.title = title
        self.tabBarItem.image = UIImage(systemName: tabBarItem)
        self.tabBarItem.standardAppearance?.selectionIndicatorTintColor = .black
    }
}
