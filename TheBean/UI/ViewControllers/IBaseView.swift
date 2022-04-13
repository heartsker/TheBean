//
//  IBaseView.swift
//  TheBean
//
//  Created by Daniel Pustotin on 19.03.2022.
//

import UIKit

protocol IBaseView {
    func setupAppearance()
    func setupSubviews()
    func setupConstraints()

    func setup()
}

extension IBaseView {
    func setup() {
        setupAppearance()
        setupSubviews()
        setupConstraints()
    }
}

extension IBaseView where Self: UIViewController {
    func setupAppearance() {
        view.backgroundColor = .background
    }
}
