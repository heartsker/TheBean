//
//  RecomendationCoffeeImageView.swift
//  TheBean
//
//  Created by Илья Чуб on 15.03.2022.
//

import SnapKit
import UIKit

class RecomendationCoffeeImageView: UIImageView {
    init(image: UIImage) {
        super.init(frame: .zero)
        settings(image: image)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func settings(image: UIImage) {
        setupSelf(image: image)
        setupConstraints()
    }

    private func setupConstraints() {
        self.snp.makeConstraints { make in
            make.width.equalTo(88)
            make.height.equalTo(83)
        }
    }

    private func setupSelf(image: UIImage) {
        self.image = image
        self.clipsToBounds = true
        self.contentMode = .scaleAspectFit
    }
}
