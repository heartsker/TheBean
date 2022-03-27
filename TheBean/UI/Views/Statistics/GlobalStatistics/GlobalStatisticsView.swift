//
//  GlobalStatisticsView.swift
//  TheBean
//
//  Created by Илья Чуб on 15.03.2022.
//

import UIKit

class GlobalStatisticsView: UIStackView, IBaseView {
    // MARK: Properties
    let globalStatisticsCards: [ICardRepresentable] = [
        MostPopularDrinkCard(text: ^CoffeeLocalization.latte + StatisticsLocalization.mostPopularDrinkSuffix),
        AverageNumberCupsCard(text: "4" + StatisticsLocalization.averageCupsPerDay, numberOfCups: 1)
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
        BlockLabel(text: ^StatisticsLocalization.globalStatistics)
    }()

    // MARK: - Setup
    func setupAppearance() {
        axis = .vertical
        distribution = .fill
    }

    func setupSubviews() {
        addArrangedSubview(label)
        setCustomSpacing(22, after: label)

        for card in globalStatisticsCards {
            addArrangedSubview( card.card )
            guard let lastSubview = subviews.last else {continue}
            setCustomSpacing(8, after: lastSubview)
        }
    }

    func setupConstraints() {}
}
