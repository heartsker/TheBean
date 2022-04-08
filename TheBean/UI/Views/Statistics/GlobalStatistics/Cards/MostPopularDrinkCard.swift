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
    let text: String

    // MARK: - Initialization
    required init(text: String) {
        self.text = text
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
            make.height.equalTo(165)
            make.width.equalTo(110)
        }

        label.snp.makeConstraints { make in
            make.left.equalTo(imageView.snp.right).offset(14)
            make.right.equalToSuperview().inset(18)
            make.goldenRatio(from: snp.top, in: .Y, size: 192)
        }
    }
}
