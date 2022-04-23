//
//  UIView.swift
//  TheBean
//
//  Created by Alina on 11.02.2022.
//

import UIKit
import Utils

extension UIViewController {
    func setupTabBar(_ title: String, image: String = "question") {
        self.title = ^title
        tabBarItem.image = UIImage(systemName: image)
    }
}
