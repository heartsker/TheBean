//
//  BodyStackView.swift
//  TheBean
//
//  Created by Daniel Pustotin on 13.03.2022.
//

import Foundation
import UIKit

class BodyStackView: UIStackView {
    
    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        distribution = .equalSpacing
        axis = .horizontal
        backgroundColor = .highlightPrimary
        layer.cornerRadius = 20
        
        setupSubviews()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Subviews
    // MARK: Scores
    lazy private var scoresStackView: UIStackView = {
        ScoresStackView()
    }()
    
    private func setupSubviews() {
        addSubview(scoresStackView)
        addSubview(levelStackView)
    }
    
    // MARK: Level label
    lazy private var userLevelLabel: UILabel = {
        UILabel(text: "\(account.level)", color: .materialHeavy, font: UIFont.systemFont(ofSize: 36, weight: .medium))
    }()
    
    // MARK: Level stack
    lazy private var levelStackView: UIStackView = {
        let level = UIStackView()
        level.distribution = .equalSpacing
        level.axis = .vertical
        level.backgroundColor = .highlightPrimary
        level.layer.cornerRadius = 20
        
        level.addSubview(userLevelImageView)
        
        return level
    }()
    
    // !!! TODO: I don't know how to do it (ring!):
    lazy private var userLevelImageView: UIImageView = {
        let userLevel = UIImageView()
        userLevel.clipsToBounds = true
        userLevel.contentMode = .scaleAspectFit
        userLevel.backgroundColor = .accentColor
        userLevel.frame.size.height = 81
        userLevel.layer.cornerRadius = userLevel.frame.height / 2
        
        userLevel.addSubview(insideCircleImageView)
        
        return userLevel
    }()
    
    lazy private var insideCircleImageView: UIImageView = {
        let insideCircle = UIImageView()
        insideCircle.clipsToBounds = true
        insideCircle.contentMode = .scaleAspectFit
        insideCircle.backgroundColor = .highlightPrimary
        insideCircle.frame.size.height = 68
        insideCircle.layer.cornerRadius = insideCircle.frame.height / 2
        
        insideCircle.addSubview(userLevelLabel)
        
        return insideCircle
    }()
}
