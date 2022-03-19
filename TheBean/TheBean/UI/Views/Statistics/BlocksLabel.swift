//
//  BlocksLabel.swift
//  TheBean
//
//  Created by Илья Чуб on 15.03.2022.
//

import UIKit
import SnapKit

class BlockLabel: UILabel, BaseViewProtocol {
    // MARK: - Initialization
    init(text: String) {
        super.init(frame: .zero)
        self.text = text
        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setup
    func setupAppearance() {
        self.textColor = .materialHeavy
        self.font = .init(name: "Muller-Trial-Bold", size: 18)
    }

    func setupSubviews() {
    }

    func setupConstraints() {
    }
}
