//
//  FitFlowLayout.swift
//  TheBean
//
//  Created by Ilya Buldin on 20.05.2022.
//

import UIKit
import AssetsManager

final class FavoriteCoffeeShopCollectionViewCell: UICollectionViewCell, IBaseView {
    private enum Constants {
        static let lightModeColor: CGColor = .init(red: 0.416, green: 0.235, blue: 0.129, alpha: 1)
        static let darkModeColor: CGColor = .init(red: 1, green: 1, blue: 1, alpha: 1)
        static let cellBorderWidth: CGFloat = 1
        static let cellCornerRadius: CGFloat = 8
    }

    private lazy var coffeeshopNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = Pallete.materialStrong
        label.font = FontManager.regular(14)
        return label
    }()

    private lazy var locationAreaLabel: UILabel = {
       let label = UILabel()
        label.textColor = Pallete.materialStrong
        label.font = FontManager.light(12)
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

}

extension FavoriteCoffeeShopCollectionViewCell {
    func setupAppearance() {
        contentView.layer.cornerRadius = Constants.cellCornerRadius
        contentView.layer.borderWidth = Constants.cellBorderWidth
        setCellBorderColorByAppearanceMode()

    }

    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        setCellBorderColorByAppearanceMode()
    }

    private func setCellBorderColorByAppearanceMode() {
        setCellBorderColorByAppearanceMode(colorInLightMode: Constants.lightModeColor,
                                           colorInDarkMode: Constants.darkModeColor)
    }

    func setupSubviews() {
        contentView.addSubview(coffeeshopNameLabel)
//        contentView.addSubview(locationAreaLabel)
    }

    func setupConstraints() {
        coffeeshopNameLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()

            make.leading.equalTo(contentView).offset(15)
            make.top.equalTo(contentView).offset(8.5)
        }

        contentView.snp.makeConstraints { make in
            make.bottom.equalTo(coffeeshopNameLabel.snp.bottom).offset(8.5)
            make.trailing.equalTo(coffeeshopNameLabel.snp.trailing).offset(15)
        }
    }
}

extension FavoriteCoffeeShopCollectionViewCell: IConfigurationWithModel {
    typealias Model = String

    func configure(model: Model) {
        coffeeshopNameLabel.text = model
    }
}
