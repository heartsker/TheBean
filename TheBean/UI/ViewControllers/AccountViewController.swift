//
//  AccountViewController.swift
//  TheBean
//
//  Created by Daniel Pustotin on 25.03.2022.
//

import UIKit

class AccountViewController: UIViewController {

    // MARK: - Properties
    private lazy var content: UIView = {
        AccountContentView()
    }()

    // MARK: - Initializators
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setupTabBar(^ControllerLocalization.account, image: "person")
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupTabBar(^ControllerLocalization.account, image: "person")
    }

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
