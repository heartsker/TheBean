//
//  MostPopularDrinkCard.swift
//  TheBean
//
//  Created by Илья Чуб on 16.03.2022.
//

import UIKit

class MostPopularDrinkCard: UIStackView, CardRepresentable {
    // MARK: - Properties
    let image: UIImage?
    let text: String

    lazy var card: UIView = {
        self
    }()

    // MARK: - Initialization
    required init(text: String) {
        self.text = text
        image = UIImage(named: "BaristaHands")
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
        let string = NSMutableAttributedString(string: text)
        string.addAttribute(.foregroundColor, value: UIColor.materialMedium, range: NSRange(text) ?? NSRange())

        let label = UILabel()
        label.font = .medium(16)
        label.attributedText = string
        label.textAlignment = .center
        label.numberOfLines = 0
        label.lineBreakMode = .byClipping
        return label
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
            make.height.equalTo(192)
        }

        imageView.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(18)
            make.centerY.equalToSuperview()
            make.height.equalTo(165)
            make.width.equalTo(110)
        }

        label.snp.makeConstraints { make in
            make.left.equalTo(imageView.snp.right).offset(14)
            make.right.equalToSuperview().inset(18)
            make.centerY.equalToSuperview()
        }
    }
}
