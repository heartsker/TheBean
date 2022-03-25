//
//  BaseViewProtocol.swift
//  TheBean
//
//  Created by Daniel Pustotin on 19.03.2022.
//

protocol BaseViewProtocol {
    func setupAppearance()
    func setupSubviews()
    func setupConstraints()

    func setup()
}

extension BaseViewProtocol {
    func setup() {
        setupAppearance()
        setupSubviews()
        setupConstraints()
    }
}
