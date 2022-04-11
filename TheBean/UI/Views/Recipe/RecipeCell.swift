//
//  RecipeCell.swift
//  TheBean
//
//  Created by Ilya Buldin on 11.04.2022.
//

import UIKit
import SnapKit

final class RecipeCell: UICollectionViewCell {
    private lazy var containerView: UIView = {
        let container = UIView()
        return container
    }()

    private(set) lazy var titleLabel: UILabel = {
        let label = UILabel()
        return label
    }()

    private(set) lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()

    private(set) lazy var volumeLabel: UILabel = {
        let label = UILabel()
        return label
    }()

    private(set) lazy var cookingTimeLabel: UILabel = {
        let label = UILabel()
        return label
    }()

    private lazy var standView: StandCustomView = {
        let standView = StandCustomView()
        return standView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

extension RecipeCell: CellConfigurationProtocol {
    func configure(model: RecipeCardModel) {
        titleLabel.text = model.title
        imageView.image = model.drinkKind.imageName
        volumeLabel.text = "\(model.volume) ml"
        cookingTimeLabel.text = "\(model.cookingTime) min"
    }
}

extension RecipeCell: IBaseView {
    func setupAppearance() {
        contentView.backgroundColor = .clear
        contentView.layer.cornerRadius = 20
        contentView.layer.borderWidth = 1
        contentView.layer.borderColor = UIColor.hightlightSecondary.cgColor

        containerView.backgroundColor = .highlightPrimary
        containerView.layer.cornerRadius = 20

        titleLabel.font = .regular()
        titleLabel.textAlignment = .center

        [volumeLabel, cookingTimeLabel].forEach { $0.font = .regular(12) }
    }

    func setupSubviews() {
        contentView.addSubview(containerView)
        [volumeLabel, cookingTimeLabel].forEach { contentView.addSubview($0) }
        containerView.addSubview(titleLabel)
        containerView.addSubview(standView)
//        [titleLabel, standView, imageView].forEach { containerView.addSubview($0) }
    }

    func setupConstraints() {
        containerView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalTo(-34)
        }

        titleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(15)
            make.leading.equalTo(12)
            make.trailing.equalTo(-12)
        }

        standView.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.height.equalTo(contentView.bounds.height / 4)
            make.width.equalTo(contentView.bounds.width - 20)
            make.centerX.equalToSuperview()
        }

//        imageView.snp.makeConstraints { make in
//            make.centerX.equalToSuperview()
//            make.bottom.equalToSuperview()
//        }

        volumeLabel.snp.makeConstraints { make in
            make.bottom.equalTo(-10)
            make.leading.equalTo(21)
        }

        cookingTimeLabel.snp.makeConstraints { make in
            make.bottom.equalTo(-10)
            make.trailing.equalTo(-21)
        }
    }
}
