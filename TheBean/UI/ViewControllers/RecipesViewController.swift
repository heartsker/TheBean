//
//  RecipesViewController.swift
//  TheBean
//
//  Created by Daniel Pustotin on 31.01.2022.
//

import UIKit

class RecipesViewController: UIViewController, IBaseView {

    // MARK: - Properties
    private lazy var button: UIButton = {
        for family in UIFont.familyNames.sorted() {
            let names = UIFont.fontNames(forFamilyName: family)
            print("Family: \(family) Font names: \(names)")
        }
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

    // MARK: - Setup
    func setupConstraints() {
        button.translatesAutoresizingMaskIntoConstraints = false
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }

    func setupSubviews() {
        view.addSubview(button)
    }
}
