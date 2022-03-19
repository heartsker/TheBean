//
//  ThreeRecomendationCoffeeStackView.swift
//  TheBean
//
//  Created by Илья Чуб on 15.03.2022.
//

import SnapKit
import UIKit

class ThreeRecomendationCoffeeStackView: UIStackView {

    var recomendations: [(String, UIImage)]

    init( recomendations: [(String, UIImage)] ) {
        self.recomendations = recomendations
        super.init(frame: .zero)
        settings(recomendations: recomendations)
    }

    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private lazy var reccomendationCoffeeStackViewLeft = RecomendationCoffeeStackView(text: recomendations[0].0, image: recomendations[0].1)
    private lazy var reccomendationCoffeeStackViewMiddle = RecomendationCoffeeStackView(text: recomendations[1].0, image: recomendations[1].1)
    private lazy var reccomendationCoffeeStackViewRight = RecomendationCoffeeStackView(text: recomendations[2].0, image: recomendations[2].1)

    private func settings(recomendations: [(String, UIImage)]) {
        setupSelf()
        setupSubviews(recomendations: recomendations)
    }

    private func setupSelf() {
        self.axis = .horizontal
        self.distribution = .equalSpacing
    }

    private func setupSubviews(recomendations: [(String, UIImage)]) {
        for stackView in [  reccomendationCoffeeStackViewLeft,
                            reccomendationCoffeeStackViewMiddle,
                            reccomendationCoffeeStackViewRight ] {
            self.addArrangedSubview(stackView)
        }
    }
}
