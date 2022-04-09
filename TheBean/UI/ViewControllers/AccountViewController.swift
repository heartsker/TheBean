//
//  AccountViewController.swift
//  TheBean
//
//  Created by Daniel Pustotin on 25.03.2022.
//

import UIKit

class AccountViewController: UIViewController, IBaseView {
    // MARK: - Properties
    private lazy var content: UIView = {
        AccountContentView()
    }()

    // MARK: - Initialization
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }

    // MARK: - Setup
    func setupSubviews() {
        view.addSubview(content)
    }

    func setupConstraints() {
        content.translatesAutoresizingMaskIntoConstraints = false
        content.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        content.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
}
