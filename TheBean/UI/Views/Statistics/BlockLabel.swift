//
//  BlockLabel.swift
//  TheBean
//
//  Created by Илья Чуб on 15.03.2022.
//

import UIKit

// MARK: BlockLabel
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

// MARK: Setup methods
extension BlockLabel {
    private func setup() {
        setupAppearance()
    }

    private func setupAppearance() {
        textColor = .materialHeavy
        // TODO: (IC) Replace with UIFont.bold
        font = .init(name: "Muller-Trial-Bold", size: 18)
    }
}
