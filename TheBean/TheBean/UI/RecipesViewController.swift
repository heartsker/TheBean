//
//  RecipesViewController.swift
//  TheBean
//
//  Created by Daniel Pustotin on 31.01.2022.
//

import Foundation
import UIKit

class RecipesViewController: BeanViewController {
    
    private lazy var button: UIButton = {
        let button = UIButton()
        button.setTitle("That is recipe", for: .normal)
        button.titleLabel!.font = UIFont(name: "Arial", size: 50)
        button.titleLabel!.textColor = .secondarySystemBackground
        button.addTarget(self, action: #selector(buttonClick(sender:)), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Recipes"
        view.addSubview(button)
        setupConstraints()
    }
    
    func setupConstraints() {
        button.translatesAutoresizingMaskIntoConstraints = false
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    @objc func buttonClick(sender: UIButton!) {
        navigationController?.pushViewController(TimerViewController(), animated: true)
    }
}
