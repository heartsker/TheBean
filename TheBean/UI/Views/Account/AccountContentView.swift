//
//  AccountContentView.swift
//  TheBean
//
//  Created by Daniel Pustotin on 25.03.2022.
//

import UIKit

class AccountContentView: UIStackView, BaseViewProtocol {
    // MARK: - Properties
    let account: Account

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
    private lazy var titleView = {
        AccountTitleView(account: account)
    }()

    // MARK: - Setup
    func setupAppearance() {
        axis = .vertical
        distribution = .fill
    }

    func setupSubviews() {
        addArrangedSubview(titleView)
    }

    func setupConstraints() {
        titleView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.height.equalTo(110)
            make.width.equalTo(110)
        }
        titleView.setupConstraints()
    }
}
