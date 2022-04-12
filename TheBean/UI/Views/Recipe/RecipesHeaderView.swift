//
//  RecipesHeaderView.swift
//  TheBean
//
//  Created by Ilya Buldin on 13.04.2022.
//

import UIKit

final class RecipesHeaderView: UICollectionReusableView {

    private(set) lazy var titleLabel: UILabel = {
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

extension RecipesHeaderView: ReuseIdentifyingProtocol { }

extension RecipesHeaderView: ConfigurationProtocol {
    func configure(model: String) {
        titleLabel.text = model
    }
}

extension RecipesHeaderView: IBaseView {
    func setupAppearance() {
        titleLabel.font = .bold(18)
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
