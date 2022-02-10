//
//  TheBeanUIViewController.swift
//  TheBean
//
//  Created by Daniel Pustotin on 10.02.2022.
//

import Foundation
import UIKit

class TheBeanVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupAppearance()
        setupSubviews()
        setupConstraints()
    }
    
    func setupSubviews() {
        
    }
    
    func setupConstraints() {
        
    }
}

extension TheBeanVC {
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
