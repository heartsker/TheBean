//
//  BlockLabel.swift
//  TheBean
//
//  Created by Ilya Chub on 15.03.2022.
//

import AssetsManager

/// Statistics block label
class BlockLabel: UILabel {

    // MARK: - Initializators
    init(text: String) {
        super.init(frame: .zero)
        self.text = text

        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Setup methods
extension BlockLabel {
    private func setup() {
        setupAppearance()
    }

    private func setupAppearance() {
        textColor = Pallete.materialHeavy
        font = FontManager.bold(18)
    }
}
