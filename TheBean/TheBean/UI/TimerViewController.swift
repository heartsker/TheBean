//
//  TimerViewController.swift
//  TheBean
//
//  Created by Daniel Pustotin on 28.01.2022.
//

import UIKit

class TimerViewController: BeanViewController {
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.text = "That is timer"
        label.font = UIFont(name: "Arial", size: 50)
        label.textColor = .secondarySystemBackground
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setupSubviews()
        setupConstraints()
//        view.backgroundColor = .red
    }
    
    func setupSubviews() {
        view.addSubview(label)
    }
    
    func setupConstraints() {
        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
}
