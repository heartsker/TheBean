//
//  PersonalRecomendationsBlockStackView.swift
//  TheBean
//
//  Created by Илья Чуб on 15.03.2022.
//

import UIKit

class PersonalRecomendationsView: UIStackView, BaseViewProtocol {
    let recomendations = [
        ("Latte", UIImage(named: "Latte")!),
        ("Flat White", UIImage(named: "Flat")!),
        ("Americano", UIImage(named: "Americano")!)
    ]

    init() {
        super.init(frame: .zero)
        setup()
    }

    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private lazy var label = BlockLabel(text: "Personal recommendations:")
    private lazy var stackView = ThreeRecomendationCoffeeStackView(recomendations: recomendations)

    // MARK: - Setup
    func setupAppearance() {
        axis = .vertical
        distribution = .equalSpacing
    }

    func setupSubviews() {
        addArrangedSubview(label)
        addArrangedSubview(stackView)
    }

    func setupConstraints() {
        snp.makeConstraints { make in
            make.height.equalTo(141)
        }
    }
}
