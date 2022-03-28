//
//  TimerViewController.swift
//  TheBean
//
//  Created by Daniel Pustotin on 28.01.2022.
//

import UIKit

class TimerViewController: UIViewController, IBaseView {
    // MARK: - Properties
    private lazy var label: UILabel = {
        UILabel(text: "That is timer", color: .materialHeavy, font: .bold(30))
    }()

    // MARK: - Initialization
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }

    // MARK: - Setup
    func setupSubviews() {
        view.addSubview(label)
    }

    func setupConstraints() {
        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
}
