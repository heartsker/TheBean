//
//  RecomendationLabel.swift
//  TheBean
//
//  Created by Илья Чуб on 15.03.2022.
//

import UIKit

class RecomendationLabel: UILabel {
    init(text: String) {
        super.init(frame: .zero)
        setupSelf(text: text)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupSelf(text: String) {
        self.text = text
        self.textAlignment = .center
        self.textColor = .materialHeavy
        // TODO: (IC) Use UIFont extension .regular(14)
        self.font = .init(name: "Muller-Trial-Regular", size: 14)
    }
}
