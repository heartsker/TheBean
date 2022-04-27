//
//  RecipeCell.swift
//  TheBean
//
//  Created by Ilya Buldin on 11.04.2022.
//

import SnapKit
import AssetsManager
import Utils

final class RecipeCell: UICollectionViewCell {

    // MARK: - Properties
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

    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        [titleLabel, volumeLabel, cookingTimeLabel].forEach { $0.text = nil }
        imageView.image = nil
    }
}

extension RecipeCell: IConfigurationWithModel {

    // MARK: - Cell Configuration
    func configure(model: RecipeCard) {
        titleLabel.text = model.title
        imageView.image = ImageManager.asset(id: .id(of: model.drinkKind))
        volumeLabel.text = "\(model.volume) ml"
        cookingTimeLabel.text = "\(model.cookingTime) min"
    }
}

extension RecipeCell: IBaseView {

    // MARK: - Setup
    func setupAppearance() {
        contentView.backgroundColor = .clear
        contentView.layer.cornerRadius = 20
        contentView.layer.borderWidth = 1
        setCellBorderColorByAppearanceMode()

        containerView.backgroundColor = Pallete.highlightPrimary
        containerView.layer.cornerRadius = 20

        titleLabel.font = FontManager.medium()
        titleLabel.textAlignment = .center

        [volumeLabel, cookingTimeLabel].forEach { $0.font = FontManager.regular(12) }
        [volumeLabel, cookingTimeLabel, titleLabel].forEach { $0.textColor = Pallete.materialMedium }

        imageView.contentMode = .scaleAspectFit
    }

    func setupSubviews() {
        contentView.addSubview(containerView)
        [volumeLabel, cookingTimeLabel].forEach { contentView.addSubview($0) }
        [titleLabel, standView, imageView].forEach { containerView.addSubview($0) }
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

        imageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalTo(contentView.bounds.width * 0.8)
            make.bottom.equalToSuperview()
            make.height.greaterThanOrEqualTo((contentView.bounds.height - 34) * 1/2)
        }

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

extension RecipeCell {

    private func setCellBorderColorByAppearanceMode() {
        let borderColorCondition = traitCollection.userInterfaceStyle == .dark
        let darkModeBorderColor: CGColor = .init(red: 0.384, green: 0.337, blue: 0.416, alpha: 1)
        let lightModeBorderColor: CGColor = .init(red: 0.858, green: 0.758, blue: 0.669, alpha: 1)
        contentView.layer.borderColor = borderColorCondition ? darkModeBorderColor : lightModeBorderColor
    }

    // CGColor cannot use dynamic color, so we need to override this method
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        setCellBorderColorByAppearanceMode()
    }
}
