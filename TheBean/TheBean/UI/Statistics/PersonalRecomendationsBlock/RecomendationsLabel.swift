//
//  RecomendationsLabel.swift
//  TheBean
//
//  Created by Илья Чуб on 15.03.2022.
//

import UIKit
import SnapKit


class RecommendationsLabel: UILabel {
    init() {
        super.init(frame: .zero)
        setupSelf()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupSelf() {
        self.text = "Personal recommendations:"
        self.textColor = .materialHeavy
        self.font = .init(name: "Muller-Trial-Bold", size: 18)
    }
}
