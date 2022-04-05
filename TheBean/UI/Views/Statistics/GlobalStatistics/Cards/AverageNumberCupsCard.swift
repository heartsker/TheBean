//
//  AverageNumberCupsCard.swift
//  TheBean
//
//  Created by Илья Чуб on 22.03.2022.
//

import UIKit

// MARK: - AverageNumberCupsCard
class AverageNumberCupsCard: BaseCardView {
    // MARK: Properties
    let cupImage: UIImage?
    let numberOfCups: Int
    let text: String

    // MARK: Initialization
    required init(text: String, numberOfCups: Int) {
        self.text = text
        self.numberOfCups = numberOfCups
        cupImage = UIImage(named: "coffee.cup")
        super.init(backgroundColor: .materialHeavy)
        setup()
    }

    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Subviews
    private lazy var label: UILabel = {
        CardLabel(text: text, isWhite: true)
    }()

    private lazy var secondBackground: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 20
        view.backgroundColor = .hightlightThirdly
        return view
    }()

//    private lazy var cupsStackView: UIStackView = {
//        let stack = UIStackView()
//        stack.axis = .horizontal
//        stack.distribution = .equalSpacing
//        for _ in stride(from: 0, to: numberOfCups, by: 1) {
//
//        }
//        return stack
//    }()
}

// MARK: - Setup methods
extension AverageNumberCupsCard {
    private func setup() {
        setupSubviews()
        setupConstraints()
    }

    private func setupSubviews() {
        addSubview(secondBackground)
        addSubview(label)
    }

    private func setupConstraints() {
        secondBackground.snp.makeConstraints { make in
            make.height.equalToSuperview().multipliedBy(0.3906)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }

        label.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(64)
            make.top.equalToSuperview().inset(28)
        }

    }
}
