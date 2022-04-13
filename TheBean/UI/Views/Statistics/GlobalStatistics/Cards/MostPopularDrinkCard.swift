//
//  MostPopularDrinkCard.swift
//  TheBean
//
//  Created by Илья Чуб on 16.03.2022.
//

import UIKit

class MostPopularDrinkCard: BaseCardView {

    // MARK: - Properties
    private let image: UIImage? = ImageManager.baristaHands
    private let value: String
    private let suffix: String = StatsLocalization.mostPopularDrinkSuffix
    private lazy var text = "\(^value) - \(suffix)"

    // MARK: - Initialization
    required init(value: String) {
        self.value = value
        super.init(backgroundColor: .highlightPrimary)
        setup()
    }

    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Subviews
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView(image: image)
        imageView.layer.cornerRadius = 20
        return imageView
    }()

    private lazy var label: UILabel = {
        CardLabel(text: text, isWhite: false)
    }()
}

// MARK: - Setup methods
extension MostPopularDrinkCard {
    private func setup() {
        setupSubviews()
        setupConstraints()
    }

    private func setupSubviews() {
        addSubview(imageView)
        addSubview(label)
    }

    private func setupConstraints() {
        snp.makeConstraints { make in
            make.height.equalTo(snp.width).multipliedBy(Card.heigthPercent)
        }

        imageView.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(Image.left)
            make.centerY.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(Image.heigthPercent)
            make.width.equalTo(imageView.snp.height).multipliedBy(Image.widthPercent)
        }

        label.snp.makeConstraints { make in
            make.left.equalTo(imageView.snp.right).offset(Label.left)
            make.right.equalToSuperview().inset(Label.right)
            make.goldenRatio(inside: snp, by: .Y, trailing: false)
        }
    }
}

// MARK: - Constraint constants
private extension MostPopularDrinkCard {
    enum Card {
        static let heigthPercent: CGFloat = 0.565
    }

    enum Image {
        static let left: CGFloat = 20
        static let heigthPercent: CGFloat = 0.8594
        static let widthPercent: CGFloat = 0.6667
    }

    enum Label {
        static let left: CGFloat = 14
        static let right: CGFloat = 16
    }
}
