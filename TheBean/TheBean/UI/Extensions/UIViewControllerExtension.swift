//
//  UIView.swift
//  TheBean
//
//  Created by Alina on 11.02.2022.
//

import UIKit

extension UIViewController {
    
    func setupTabBar(_ title: String = "What?", image: String = "question") {
        self.title = title
        tabBarItem.image = UIImage(systemName: image)
    }
    
    func setupAppearance() {
        view.backgroundColor = UIColor(named: "Background")
    }
}
