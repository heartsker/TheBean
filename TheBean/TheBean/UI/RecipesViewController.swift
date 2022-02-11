//
//  RecipesViewController.swift
//  TheBean
//
//  Created by Daniel Pustotin on 31.01.2022.
//

import UIKit

class RecipesViewController: UIViewController {
    
    private lazy var button: UIButton = {
        let button = UIButton()
        button.setTitle("That is recipe", for: .normal)
        button.titleLabel!.font = UIFont(name: "Arial", size: 50)
        button.titleLabel!.textColor = .black
        button.addTarget(self, action: #selector(buttonClick(sender:)), for: .touchUpInside)
        return button
    }()
    
    @objc func buttonClick(sender: UIButton!) {
        navigationController?.pushViewController(TimerViewController(), animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupAppearance(title: "Recipes", tabBarItem: "book")
        
        setupSubviews()
        setupConstraints()
    }
    
    private func setupConstraints() {
        button.translatesAutoresizingMaskIntoConstraints = false
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    private func setupSubviews() {
        view.addSubview(button)
    }
}
