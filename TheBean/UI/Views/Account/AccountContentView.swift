//
//  AccountContentView.swift
//  TheBean
//
//  Created by Daniel Pustotin on 25.03.2022.
//

import UIKit

class AccountContentView: UIStackView {

    // MARK: - Initialization
    init() {
        super.init(frame: .zero)
        setup()
    }

    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Subviews
    private lazy var titleView = {
        AccountTitleView()
    }()
}

// MARK: - Setup methods
extension AccountContentView {
    private func setup() {
        setupAppearance()
        setupSubviews()
        setupConstraints()
    }

    private func setupAppearance() {
        axis = .vertical
        distribution = .fill
    }

    private func setupSubviews() {
        addArrangedSubview(titleView)
    }

    private func setupConstraints() {
        titleView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.height.equalTo(300)
            make.width.equalTo(300)
        }
    }
}
