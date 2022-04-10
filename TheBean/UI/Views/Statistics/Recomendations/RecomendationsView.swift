//
//  RecomendationsView.swift
//  TheBean
//
//  Created by Илья Чуб on 15.03.2022.
//

import UIKit

class RecomendationsView: UIStackView, IBaseView {
    // MARK: - Properties
    let recomendations = [
        (^CoffeeLocalization.latte, ImageManager.latte),
        (^CoffeeLocalization.flatwhite, ImageManager.flatwhite),
        (^CoffeeLocalization.americano, ImageManager.americano)
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
        BlockLabel(text: ^StatsLocalization.personalRecomendations)
    }()

    private lazy var topRecomendations = { TopRecomendationsView(recomendations: recomendations)
    }()

    // MARK: - Setup
    func setupAppearance() {
        axis = .vertical
        distribution = .equalSpacing
    }

    func setupSubviews() {
        addArrangedSubview(label)
        addArrangedSubview(topRecomendations)
    }

    func setupConstraints() {
        snp.makeConstraints { make in
            make.height.equalTo(141)
        }
    }
}
