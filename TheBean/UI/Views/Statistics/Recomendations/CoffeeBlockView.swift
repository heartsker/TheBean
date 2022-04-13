//
//  CoffeeBlockView.swift
//  TheBean
//
//  Created by Илья Чуб on 15.03.2022.
//

import UIKit

class CoffeeBlockView: UIStackView {

    // MARK: - Properties
    private var recomendation: CoffeeRecomendation

    // MARK: - Initialization
    init(_ recomendation: CoffeeRecomendation) {
        self.recomendation = recomendation
        super.init(frame: .zero)
        setup()
    }

    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Subviews
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView(image: recomendation.image)
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    private lazy var labelView: UILabel = {
        let label = UILabel(text: recomendation.text,
                            color: .materialHeavy,
                            font: .regular(14))
        label.textAlignment = .center
        return label
    }()
}

// MARK: - Setup methods
extension CoffeeBlockView {
    private func setup() {
        setupAppearance()
        setupSubviews()
        setupConstraints()
    }

    private func setupAppearance() {
        axis = .vertical
        distribution = .equalSpacing
    }

    private func setupSubviews() {
        addArrangedSubview(imageView)
        addArrangedSubview(labelView)
    }

    private func setupConstraints() {
        imageView.snp.makeConstraints { make in
            make.width.equalTo(88)
            make.height.equalTo(83)
        }

        snp.makeConstraints { make in
            make.height.equalTo(105)
        }
    }
}
