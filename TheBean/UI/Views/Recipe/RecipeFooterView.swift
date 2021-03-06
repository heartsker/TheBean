//
//  RecipeFooterView.swift
//  TheBean
//
//  Created by Ilya Buldin on 13.04.2022.
//

import AssetsManager
import Utils

protocol IRecipesFooterDelegate: AnyObject {
    func sectionFooterButtonTapped()
}

final class RecipesFooterView: UICollectionReusableView {

    weak var delegate: IRecipesFooterDelegate?

    private var buttonLabel: UIButton = {
        let button = UIButton()
        button.setTitle("Load more", for: .normal)
        button.setTitleColor(.white, for: .normal)
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        buttonLabel.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
        buttonLabel.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }

    @objc func buttonTapped() {
        delegate?.sectionFooterButtonTapped()
    }
}

extension RecipesFooterView: IReuseIdentifiable { }

extension RecipesFooterView: IBaseView {
    func setupAppearance() {
        buttonLabel.titleLabel?.font = FontManager.regular(13)
        buttonLabel.layer.cornerRadius = 18
        buttonLabel.backgroundColor = Pallete.accentColor
    }

    func setupSubviews() {
        addSubview(buttonLabel)
    }

    func setupConstraints() {
        buttonLabel.snp.makeConstraints { make in
            make.trailing.equalTo(-RecipesViewController.LayoutConstants.leftRightInset)
            make.centerY.equalToSuperview()
            make.width.equalTo(100)
            make.height.equalTo(36)
        }
    }
}
