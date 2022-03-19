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
        PersonalRecomendationsView()
    }()

    private lazy var globalStatisticsView = {
        GlobalStatisticsView()
    }()

    // MARK: - Setup
    func setupAppearance() {
        self.axis = .vertical
        self.distribution = .fill
    }

    func setupSubviews() {
        self.addArrangedSubview(personalRecomendationsView)
        self.setCustomSpacing(46, after: personalRecomendationsView)
        self.addArrangedSubview(globalStatisticsView)
    }

    func setupConstraints() {
    }
}
