//
//  BaseCardView.swift
//  TheBean
//
//  Created by Илья Чуб on 05.04.2022.
//

import UIKit
import SnapKit

// MARK: BaseCardView
class BaseCardView: UIView, ICardRepresentable {

    // MARK: - Properties
    var card: UIView { self }
    private var heightWidthRatio: CGFloat

    // MARK: - Initializers
    init(backgroundColor: UIColor, heightWidthRatio: CGFloat = 0.6095) {
        self.heightWidthRatio = heightWidthRatio
        super.init(frame: .zero)
        setup(backgroundColor: backgroundColor)
    }

    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: Setup methods
extension BaseCardView {
    private func setup(backgroundColor: UIColor) {
        setupAppearance(backgroundColor: backgroundColor)
        setupConstraints()
    }

    private func setupAppearance(backgroundColor: UIColor) {
        let cornerRadius: CGFloat = 20

        self.backgroundColor = backgroundColor
        layer.cornerRadius = cornerRadius
    }

    private func setupConstraints() {
        snp.makeConstraints { make in
            make.height.equalTo(snp.width).multipliedBy(heightWidthRatio)
        }
    }
}
