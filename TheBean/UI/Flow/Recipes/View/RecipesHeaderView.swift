//
//  RecipesHeaderView.swift
//  TheBean
//
//  Created by Ilya Buldin on 13.04.2022.
//

import AssetsManager
import Utils

final class RecipesHeaderView: UICollectionReusableView {

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
}

extension RecipesHeaderView: IReuseIdentifiable { }

extension RecipesHeaderView: IConfigurationWithModel {
    func configure(model: String) {
        titleLabel.text = model
    }
}

extension RecipesHeaderView: IBaseView {
    func setupAppearance() {
        titleLabel.font = FontManager.bold(18)
    }

    func setupSubviews() {
        addSubview(titleLabel)
    }

    func setupConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.leading.equalTo(RecipesViewController.LayoutConstants.leftRightInset)
            make.bottom.equalToSuperview()
        }
    }
}

final class RecipesTableHeaderView: UITableViewHeaderFooterView {

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        return label
    }()

    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
}

extension RecipesTableHeaderView: IReuseIdentifiable { }

extension RecipesTableHeaderView: IConfigurationWithModel {
    func configure(model: String) {
        titleLabel.text = model
    }
}

extension RecipesTableHeaderView: IBaseView {
    func setupAppearance() {
        titleLabel.font = FontManager.bold(18)
    }

    func setupSubviews() {
        addSubview(titleLabel)
    }

    func setupConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.leading.equalTo(RecipesViewController.LayoutConstants.leftRightInset)
            make.bottom.equalToSuperview()
        }
    }
}
