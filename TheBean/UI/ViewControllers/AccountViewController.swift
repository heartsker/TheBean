//
//  AccountViewController.swift
//  TheBean
//
//  Created by Daniel Pustotin on 25.03.2022.
//

import UIKit

// MARK: - AccountViewController
class AccountViewController: UIViewController {
    // MARK: Properties
    private lazy var content: UIView = {
        AccountContentView()
    }()

    // MARK: Initializators
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
}

// MARK: - Setup methods
extension AccountViewController {
    private func setup() {
        setupSubviews()
        setupConstraints()
    }

    func setupSubviews() {
        view.addSubview(content)
    }

    func setupConstraints() {
        content.translatesAutoresizingMaskIntoConstraints = false
        content.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        content.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
}
