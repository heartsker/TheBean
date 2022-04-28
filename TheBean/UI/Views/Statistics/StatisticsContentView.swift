//
//  StatisticsContentStackView.swift
//  TheBean
//
//  Created by Ilya Chub on 16.03.2022.
//
import UIKit

class StatisticsContentView: UIStackView {

    // MARK: - Initialization
    init() {
        super.init(frame: .zero)
        setup()
    }

    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Subviews
    private lazy var scoreView = ScoreView()
    private lazy var personalRecomendationsView = RecomendationsView()
    private lazy var globalStatisticsView = GlobalStatisticsView()
}

// MARK: - Setup methods
extension StatisticsContentView {
    private func setup() {
        setupAppearance()
        setupSubviews()
    }

    private func setupAppearance() {
        axis = .vertical
        distribution = .fill
    }

    private func setupSubviews() {
        addArrangedSubview(scoreView)
        setCustomSpacing(38, after: scoreView)
        addArrangedSubview(personalRecomendationsView)
        setCustomSpacing(46, after: personalRecomendationsView)
        addArrangedSubview(globalStatisticsView)
    }
}
