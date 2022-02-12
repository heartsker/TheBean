//
//  TimerViewController.swift
//  TheBean
//
//  Created by Daniel Pustotin on 28.01.2022.
//

import UIKit

class TimerViewController: UIViewController {
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.text = "That is timer"
        label.font = UIFont(name: "Arial", size: 50)
        label.textColor = .materialPrimary
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupAppearance()
        
        setupSubviews()
        setupConstraints()
    }
    
    private func setupSubviews() {
        view.addSubview(label)
    }
    
    private func setupConstraints() {
        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
}
