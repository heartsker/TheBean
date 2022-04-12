//
//  MostPopularDrinkCard.swift
//  TheBean
//
//  Created by Илья Чуб on 16.03.2022.
//

import UIKit

// MARK: MostPopularDrinkCard
class MostPopularDrinkCard: BaseCardView {

    // MARK: - Properties
    let image: UIImage?
    let value: String
    let suffix: String = StatsLocalization.mostPopularDrinkSuffix
    lazy var text = "\(^value) - \(suffix)"

    // MARK: - Initialization
    required init(value: String) {
        self.value = value
        image = UIImage(named: "coffee.barista.hands")
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

// MARK: Setup methods
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
        imageView.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(18)
            make.centerY.equalToSuperview()
            make.bottom.top.equalToSuperview().inset(13)
            make.width.equalTo(imageView.snp.height).multipliedBy(0.6666)
        }

        label.snp.makeConstraints { make in
            make.left.equalTo(imageView.snp.right).offset(14)
            make.right.equalToSuperview().inset(18)
            make.goldenRatio(from: snp.top, in: .Y, size: 192)
        }
    }
}
