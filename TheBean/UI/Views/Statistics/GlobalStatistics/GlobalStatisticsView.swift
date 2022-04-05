//
//  GlobalStatisticsView.swift
//  TheBean
//
//  Created by Илья Чуб on 15.03.2022.
//

import UIKit

// MARK: - GlobalStatisticsView
class GlobalStatisticsView: UIStackView {
    // MARK: Properties
    let globalStatisticsCards: [ICardRepresentable] = [
        MostPopularDrinkCard(text: "Latte - is the most popular drink among The Bean users"),
        AverageNumberCupsCard(text: "4 - is an average number of cups per day", numberOfCups: 1)
    ]

    // MARK: Initialization
    init() {
        super.init(frame: .zero)
        setup()
    }

    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Subviews
    private lazy var label = {
        BlockLabel(text: ^StatsLocalization.globalStatistics)
    }()
}

// MARK: - GlobalStatisticsView
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
