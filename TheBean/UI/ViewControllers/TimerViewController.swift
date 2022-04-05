//
//  TimerViewController.swift
//  TheBean
//
//  Created by Daniel Pustotin on 28.01.2022.
//

import UIKit

// MARK: - TimerViewController
class TimerViewController: UIViewController {
    // MARK: Properties
    private lazy var label: UILabel = {
        UILabel(text: "That is timer", color: .materialHeavy, font: .bold(30))
    }()

    // MARK: Initialization
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
}

extension TimerViewController {
    private func setup() {
        setupSubviews()
        setupConstraints()
    }

    // MARK: - Setup
    private func setupSubviews() {
        view.addSubview(label)
    }

    private func setupConstraints() {
        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
}
