//
//  PersonalRecomendationsBlockStackView.swift
//  TheBean
//
//  Created by Илья Чуб on 15.03.2022.
//

import Foundation
import UIKit


class PersonalRecomendationsBlockStackView: UIStackView {
    var recomendations: [(String, UIImage)]
    
    init( recomendations: [(String, UIImage)] ){
        self.recomendations = recomendations
        super.init(frame: .zero)
        settings()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var label = RecommendationsLabel()
    private lazy var stackView = ThreeRecomendationCoffeeStackView(recomendations: recomendations)
    
    private func settings() {
        setupSelf()
        setupSubviews()
        setupConstraints()
    }
    
    private func setupSelf() {
        self.axis = .vertical
        self.distribution = .equalSpacing
    }
    
    private func setupSubviews() {
        self.addArrangedSubview(label)
        self.addArrangedSubview(stackView)
    }
    
    private func setupConstraints() {
        self.snp.makeConstraints { make in
            make.height.equalTo(141)
        }
    }
}
