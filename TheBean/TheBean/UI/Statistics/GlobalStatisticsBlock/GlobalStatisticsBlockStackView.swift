//
//  GlobalStatisticsBlockStackView.swift
//  TheBean
//
//  Created by Илья Чуб on 15.03.2022.
//

import Foundation
import UIKit


class GlobalStatisticsBlockStackView <T: GlobalStatisticsCardProtocol>: UIStackView {
    var globalStatisticsCards: [T]
    
    init (globalStatisticsCards: [T]) {
        self.globalStatisticsCards = globalStatisticsCards
        super.init(frame: .zero)
        settings()
        
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var label = BlockLabel(text: "Global Statistics:")
    
    private func settings() {
        setupSelf()
        setupSubviews()
        setupConstraints()
    }
    
    private func setupSelf() {
        self.axis = .vertical
        self.distribution = .fill
    }
    
    private func setupSubviews() {
        self.addArrangedSubview(label)
        self.setCustomSpacing(22, after: label)
        
        for card in self.globalStatisticsCards {
            self.addArrangedSubview( card.getGlobalStatisticsCard() )
            guard let lastSubview = self.subviews.last else {continue}
            self.setCustomSpacing(8, after: lastSubview)
        }
    }
    
    private func setupConstraints() {
        
    }
}
