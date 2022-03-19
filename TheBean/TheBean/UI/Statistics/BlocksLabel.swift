//
//  BlocksLabel.swift
//  TheBean
//
//  Created by Илья Чуб on 15.03.2022.
//


import UIKit
import SnapKit


class BlockLabel: UILabel {
    init(text: String) {
        super.init(frame: .zero)
        setupSelf(text: text)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupSelf(text: String) {
        self.text = text
        self.textColor = .materialHeavy
        self.font = .init(name: "Muller-Trial-Bold", size: 18)
    }
}
