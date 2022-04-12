//
//  AverageNumberCupsCard.swift
//  TheBean
//
//  Created by Илья Чуб on 22.03.2022.
//

import UIKit

// MARK: AverageNumberCupsCard
class AverageNumberCupsCard: BaseCardView {
    // MARK: - Properties
    let value: Int
    let cupImage: UIImage? = UIImage(named: "coffee.cup")
    let suffix = StatsLocalization.averageCupsPerDay
    lazy var text = "\(value) - \(suffix)"

    // MARK: - Initializers
    required init(value: Int) {
        self.value = value
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

    private lazy var cupsStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fillProportionally
        for _ in stride(from: 0, to: value, by: 1) {
            let imageView = UIImageView(image: cupImage)
            imageView.contentMode = .scaleAspectFit
            stack.addArrangedSubview(imageView)
        }
        return stack
    }()
}

// MARK: Setup methods
extension AverageNumberCupsCard {
    private func setup() {
        setupSubviews()
        setupConstraints()
    }

    private func setupSubviews() {
        addSubview(secondBackground)
        addSubview(label)
        addSubview(cupsStackView)
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

        cupsStackView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(21)
            make.bottom.equalToSuperview().inset(UIScreen.main.bounds.width*0.015)
            make.height.equalTo(UIScreen.main.bounds.width*0.25)
        }
        layoutIfNeeded()
    }
}
