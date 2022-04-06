//
//  AverageNumberCupsCard.swift
//  TheBean
//
//  Created by Илья Чуб on 22.03.2022.
//

import UIKit

class AverageNumberCupsCard: UIStackView, ICardRepresentable {
    // MARK: - Properties
    let cupImage: UIImage?
    let numberOfCups: Int
    let text: String
    let cornerRadius: CGFloat = 20

    lazy var card: UIView = {
        self
    }()

    // MARK: - Initialization
    required init(text: String, numberOfCups: Int) {
        self.text = text
        self.numberOfCups = numberOfCups
        cupImage = UIImage(named: "coffee.cup")
        super.init(frame: .zero)
        setup()
    }

    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private lazy var label: UILabel = {
        CardLabel(text: text, isWhite: true)
    }()

    private lazy var secondBackground: UIView = {
        let view = UIView()
        view.layer.cornerRadius = cornerRadius
        view.backgroundColor = .hightlightThirdly
        return view
    }()

    private lazy var cupsStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .equalSpacing
        for _ in stride(from: 0, to: numberOfCups, by: 1) {

        }
        return stack
    }()

    // MARK: - Setup
    func setupAppearance() {
        backgroundColor = .materialHeavy
        layer.cornerRadius = cornerRadius
    }

    func setupSubviews() {
        addSubview(secondBackground)
        addSubview(label)
    }

    func setupConstraints() {
        snp.makeConstraints { make in
            make.height.equalTo(snp.width).multipliedBy(Card.heigthPercent)
        }

        secondBackground.snp.makeConstraints { make in
            make.height.equalToSuperview().multipliedBy(SecondBackground.heigthPercent)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }

        label.snp.makeConstraints { make in
            make.width.equalToSuperview().multipliedBy(Label.widthPercent)
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(Label.top)
        }
    }
}

extension AverageNumberCupsCard {
    enum Card {
        static let heigthPercent: CGFloat = 0.565
    }

    enum SecondBackground {
        static let heigthPercent: CGFloat = 0.3906
    }

    enum Label {
        static let widthPercent: CGFloat = 0.5714
        static let top: CGFloat = 27
    }
}
