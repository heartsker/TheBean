////
////  ScoresStackView.swift
////  TheBean
////
////  Created by Daniel Pustotin on 13.03.2022.
////
//
//import Foundation
//import UIKit
//
//class ScoresStackView: UIStackView {
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        
//        distribution = .equalSpacing
//        axis = .vertical
//        backgroundColor = .highlightPrimary
//        layer.cornerRadius = 20
//        
//        setupSubviews()
//    }
//    
//    required init(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    private func setupSubviews() {
//        addSubview(scoreLabel)
//        addSubview(statisticsStackView)
//    }
//    
//    lazy private var scoreLabel: UILabel = {
//        UILabel(text: "Score", color: .materialMedium, font: UIFont.systemFont(ofSize: 18, weight: .bold))
//    }()
//    
//    lazy private var statisticsStackView: UIStackView = {
//        StatisticsStackView()
//    }()
//}
