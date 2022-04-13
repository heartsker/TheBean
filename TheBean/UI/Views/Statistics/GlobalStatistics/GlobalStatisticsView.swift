//
//  GlobalStatisticsView.swift
//  TheBean
//
//  Created by Илья Чуб on 15.03.2022.
//

import UIKit

class GlobalStatisticsView: UIStackView {

    // MARK: - Properties
    private let globalStatisticsCards: [ICardRepresentable] = [
        MostPopularDrinkCard(value: CoffeeLocalization.latte),
        AverageNumberCupsCard(value: 4),
        RecipesNumberCard(value: 129)
    ]

    // MARK: - Initializators
    init() {
        super.init(frame: .zero)
        setup()
    }

    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Subviews
    private lazy var label = {
        BlockLabel(text: ^StatsLocalization.globalStatistics)
    }()
}

// MARK: - Setup methods
extension GlobalStatisticsView {
    private func setup() {
        setupAppearance()
        setupSubviews()
    }

    private func setupAppearance() {
        axis = .vertical
        distribution = .fill
    }

    private func setupSubviews() {
        addArrangedSubview(label)
        setCustomSpacing(22, after: label)

        for card in globalStatisticsCards {
            addArrangedSubview( card.card )
            guard let lastSubview = subviews.last else {continue}
            setCustomSpacing(8, after: lastSubview)
        }
    }
}
