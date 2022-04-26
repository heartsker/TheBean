//
//  TopRecomendationsView.swift
//  TheBean
//
//  Created by Ilya Chub on 15.03.2022.
//

import SnapKit
import Utils

/// Top recomendations view
class TopRecomendationsView: UIStackView {

    // MARK: - Properties
    private var recomendations: [CoffeeRecomendation]

    // MARK: - Initializations
    init(recomendations: [CoffeeRecomendation] ) {
        self.recomendations = recomendations
        super.init(frame: .zero)
        setup()
    }

    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Subviews
    private lazy var placesViews = {
        recomendations.map { (recomendation: CoffeeRecomendation) in
            CoffeeBlockView(recomendation)
        }
    }()
}

// MARK: - Setup methods
extension TopRecomendationsView {
    private func setup() {
        setupAppearance()
        setupSubviews()
    }

    private func setupAppearance() {
        axis = .horizontal
        distribution = .equalSpacing
    }

    private func setupSubviews() {
        for stackView in placesViews {
            addArrangedSubview(stackView)
        }
    }
}
