//
//  IBaseView.swift
//  TheBean
//
//  Created by Daniel Pustotin on 19.03.2022.
//

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
