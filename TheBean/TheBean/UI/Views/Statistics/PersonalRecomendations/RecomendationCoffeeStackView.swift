//
//  RecomendationCoffeeStackView.swift
//  TheBean
//
//  Created by Илья Чуб on 15.03.2022.
//

import UIKit

class RecomendationCoffeeStackView: UIStackView {
    var text: String
    var image: UIImage

    init(text: String, image: UIImage) {
        self.text = text
        self.image = image
        super.init(frame: .zero)
        settings()
    }

    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private lazy var imageView = RecomendationCoffeeImageView(image: image)
    private lazy var labelView = RecomendationLabel(text: text)

    private func settings() {
        setupSelf()
        setupSubviews()
        setupConstraints()
    }

    private func setupSelf() {
        self.axis = .vertical
        self.distribution = .equalSpacing
    }

    private func setupSubviews() {
        addArrangedSubview(imageView)
        addArrangedSubview(labelView)
    }

    private func setupConstraints() {
        self.snp.makeConstraints { make in
            make.height.equalTo(105)
        }
    }
}
