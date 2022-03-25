//
//  AccountTitleView.swift
//  TheBean
//
//  Created by Daniel Pustotin on 25.03.2022.
//

import UIKit

class AccountTitleView: UIStackView, BaseViewProtocol {
    // MARK: - Properties
    var account: Account

    // MARK: - Initialization
    // MARK: Initialization
    init(account: Account) {
        self.account = account
        super.init(frame: .zero)
        setup()
    }

    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Subviews
    private lazy var imageView: UIImageView = {
        let image = UIImageView(image: UIImage(named: "account.profile.picture"))
        return image
    }()

    // MARK: - Setup
    func setupAppearance() {
        axis = .vertical
        distribution = .fill
    }

    func setupSubviews() {
        addSubview(imageView)
    }

    func setupConstraints() {
        imageView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalTo(300)
            make.height.equalTo(300)
        }
    }
}
