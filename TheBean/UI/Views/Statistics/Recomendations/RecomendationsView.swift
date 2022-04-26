//
//  RecomendationsView.swift
//  TheBean
//
//  Created by Ilya Chub on 15.03.2022.
//

import AssetsManager
import Localize
import Utils

class RecomendationsView: UIStackView {
    // MARK: - Properties
    let recomendations = [
        CoffeeRecomendation(drinkKind: .latte),
        CoffeeRecomendation(drinkKind: .flatwhite),
        CoffeeRecomendation(drinkKind: .americano)
    ]

    // MARK: - Initialization
    init() {
        super.init(frame: .zero)
        setup()
    }

    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Subviews
    private lazy var label = {
        BlockLabel(text: ^StatsLocalization.personalRecomendations)
    }()

    private lazy var topRecomendations = {
        TopRecomendationsView(recomendations: recomendations)
    }()
}

// MARK: - Setup methods
extension RecomendationsView {
    private func setup() {
        setupAppearance()
        setupSubviews()
        setupConstraints()
    }

    func setupAppearance() {
        axis = .vertical
        distribution = .equalSpacing
    }

    func setupSubviews() {
        addArrangedSubview(label)
        addArrangedSubview(topRecomendations)
    }

    func setupConstraints() {
        snp.makeConstraints { make in
            make.height.equalTo(141)
        }
    }
}
