//
//  CoffeeBlockView.swift
//  TheBean
//
//  Created by Илья Чуб on 15.03.2022.
//

import UIKit

class CoffeeBlockView: UIStackView, IBaseView {
    // MARK: - Properties
    var text: String
    var image: UIImage

    // MARK: - Initialization
    init(text: String, image: UIImage) {
        self.text = text
        self.image = image
        super.init(frame: .zero)

        setup()
    }

    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Subviews
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView(image: image)
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    private lazy var labelView: UILabel = {
        let label = UILabel(text: text, color: .materialHeavy, font: .regular(14))
        label.textAlignment = .center
        return label
    }()

    // MARK: - Setup
    func setupAppearance() {
        axis = .vertical
        distribution = .equalSpacing
    }

    func setupSubviews() {
        addArrangedSubview(imageView)
        addArrangedSubview(labelView)
    }

    func setupConstraints() {
        imageView.snp.makeConstraints { make in
            make.width.equalTo(88)
            make.height.equalTo(83)
        }

        snp.makeConstraints { make in
            make.height.equalTo(105)
        }
    }
}
