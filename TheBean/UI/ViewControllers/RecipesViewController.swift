//
//  RecipesViewController.swift
//  TheBean
//
//  Created by Daniel Pustotin on 31.01.2022.
//

import UIKit

// MARK: RecipesViewController
class RecipesViewController: UIViewController {
    // MARK: - Properties
    private lazy var button: UIButton = {
        let button = UIButton(text: "That is recipe", color: .materialHeavy, font: .bold(30))
        button.addTarget(self, action: #selector(buttonClick(sender:)), for: .touchUpInside)
        return button
    }()

    // MARK: - Methods
    @objc func buttonClick(sender: UIButton!) {
        navigationController?.pushViewController(TimerViewController(), animated: true)
    }

    // MARK: - Initialization
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
}

// MARK: Setup methods
extension RecipesViewController {
    private func setup() {
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
