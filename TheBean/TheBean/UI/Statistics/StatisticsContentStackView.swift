//
//  StatisticsContentStackView.swift
//  TheBean
//
//  Created by Илья Чуб on 16.03.2022.
//

import Foundation
import UIKit

// убрать T

class StatisticsContentStackView : UIStackView {
    
    let account: Account
    let recomendationsForUser:  [(String, UIImage)]
    let globalStatisticsCards: [GlobalStatisticsCardProtocol]
    
    init(
        account: Account,
        recomendationsForUser:  [(String, UIImage)],
        globalStatisticsCards: [T]
    ){
        self.account = account
        self.recomendationsForUser = recomendationsForUser
        self.globalStatisticsCards = globalStatisticsCards
        super.init(frame: .zero)
        settings()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var personalRecomendationsBlockStackView = {
        PersonalRecomendationsBlockStackView(recomendations: recomendationsForUser)
    }()
    
    private lazy var globalStatisticsBlockStackView = {
        GlobalStatisticsBlockStackView(globalStatisticsCards: globalStatisticsCards)
    }()
    
    private func settings() {
        setupSelf()
        setupSubviews()
    }
    
    private func setupSelf() {
        self.axis = .vertical
        self.distribution = .fill
    }
    
    private func setupSubviews() {
        self.addArrangedSubview(personalRecomendationsBlockStackView)
        self.setCustomSpacing(46, after: personalRecomendationsBlockStackView)
        self.addArrangedSubview(globalStatisticsBlockStackView)
    }
}
