//
//  StatisticsContentStackView.swift
//  TheBean
//
//  Created by Илья Чуб on 16.03.2022.
//

import UIKit

class StatisticsContentView: UIStackView, BaseViewProtocol {
    // MARK: - Properties
    let account: Account

    // MARK: Initialization
    init(account: Account) {
        self.account = account
        super.init(frame: .zero)
        setup()
    }

    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Subviews
    private lazy var personalRecomendationsView = {
        RecomendationsView()
    }()

    private lazy var globalStatisticsView = {
        GlobalStatisticsView()
    }()

    // MARK: - Setup
    func setupAppearance() {
        axis = .vertical
        distribution = .fill
    }

    func setupSubviews() {
        addArrangedSubview(personalRecomendationsView)
        setCustomSpacing(46, after: personalRecomendationsView)
        addArrangedSubview(globalStatisticsView)
    }

    func setupConstraints() {}
}
