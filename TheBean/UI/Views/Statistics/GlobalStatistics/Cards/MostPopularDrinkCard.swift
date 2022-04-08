//
//  MostPopularDrinkCard.swift
//  TheBean
//
//  Created by Илья Чуб on 16.03.2022.
//

import UIKit

class MostPopularDrinkCard: UIStackView, ICardRepresentable {
    // MARK: - Properties
    let image: UIImage?
    let text: String

    lazy var card: UIView = {
        self
    }()

    // MARK: - Initialization
    required init(text: String) {
        self.text = text
        image = UIImage(named: "coffee.barista.hands")
        super.init(frame: .zero)
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

    // MARK: - Setup
    func setupAppearance() {
        backgroundColor = .highlightPrimary
        layer.cornerRadius = 20
    }

    func setupSubviews() {
        addSubview(imageView)
        addSubview(label)
    }

    func setupConstraints() {
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
            make.goldenRatio(from: snp, in: .Y, trailing: false)
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
