//
//  RecomendationsView.swift
//  TheBean
//
//  Created by Илья Чуб on 15.03.2022.
//

import UIKit

class RecomendationsView: UIStackView, IBaseView {
    // MARK: Properties
    let recomendations = [
        (^CoffeeLocalization.latte, UIImage(named: "latte")!),
        (^CoffeeLocalization.flatwhite, UIImage(named: "flatwhite")!),
        (^CoffeeLocalization.americano, UIImage(named: "americano")!)
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
        BlockLabel(text: ^StatisticsLocalization.personalRecomendations)
    }()

    private lazy var topRecomendations = {
        TopRecomendationsView(recomendations: recomendations)
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
