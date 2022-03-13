//
//  AccountStatisticsCardView.swift
//  TheBean
//
//  Created by Daniel Pustotin on 13.03.2022.
//

import UIKit

class AccountStatisticsCardView: UIView {
    var account: Account
    
    lazy private var cardStackView: UIStackView = {
        let card = UIStackView()
        card.distribution = .equalSpacing
        card.axis = .vertical
        card.backgroundColor = .highlightPrimary
        card.layer.cornerRadius = 20
        
        card.addSubview(headingStackView)
        card.addSubview(bodyStackView)
        
        return card
    }()
    
    // MARK: - Heading
    lazy private var headingStackView: UIStackView = {
        let heading = UIStackView()
        heading.distribution = .equalSpacing
        heading.axis = .horizontal
        heading.backgroundColor = .highlightPrimary
        heading.layer.cornerRadius = 20
        
        heading.addSubview(nameLabel)
        heading.addSubview(pictureImageView)
        
        return heading
    }()
    
    lazy private var nameLabel: UILabel = {
        UILabel(text: account.username, color: .materialHeavy, font: UIFont.systemFont(ofSize: 24, weight: .bold))
    }()
    
    lazy private var pictureImageView: UIImageView = {
        let picture = UIImageView(image: account.picture)
        picture.clipsToBounds = true
        picture.contentMode = .scaleAspectFit
        return picture
    }()
    
    // MARK: - Body
    lazy private var bodyStackView: UIStackView = {
        let body = UIStackView()
        body.distribution = .equalSpacing
        body.axis = .horizontal
        body.backgroundColor = .highlightPrimary
        body.layer.cornerRadius = 20
        
        body.addSubview(scoresStackView)
        body.addSubview(levelStackView)
        
        return body
    }()
    
    lazy private var scoresStackView: UIStackView = {
        let body = UIStackView()
        body.distribution = .equalSpacing
        body.axis = .vertical
        body.backgroundColor = .highlightPrimary
        body.layer.cornerRadius = 20
        
        body.addSubview(scoreLabel)
        body.addSubview(statisticsStackView)
        
        return body
    }()
    
    lazy private var scoreLabel: UILabel = {
        UILabel(text: "Score", color: .materialMedium, font: UIFont.systemFont(ofSize: 18, weight: .bold))
    }()
    
    lazy private var statisticsStackView: UIStackView = {
        let statistics = UIStackView()
        statistics.distribution = .equalSpacing
        statistics.axis = .vertical
        statistics.backgroundColor = .highlightPrimary
        statistics.layer.cornerRadius = 20
        
        statistics.addSubview(cupsStatisticsStackView)
        statistics.addSubview(recipesStatisticsStackView)
        statistics.addSubview(healthStatisticsStackView)
        
        return statistics
    }()
    
    lazy private var cupsStatisticsStackView: UIStackView = {
        let cupsStatistics = UIStackView()
        cupsStatistics.distribution = .equalSpacing
        cupsStatistics.axis = .horizontal
        cupsStatistics.backgroundColor = .highlightPrimary
        cupsStatistics.layer.cornerRadius = 20
        
        cupsStatistics.addSubview(cupsDrunkLabel)
        cupsStatistics.addSubview(cupsDrunkResultLabel)
        
        return cupsStatistics
    }()
    
    lazy private var cupsDrunkLabel: UILabel = {
        UILabel(text: "Cups drunk", color: .materialMedium, font: UIFont.systemFont(ofSize: 13, weight: .light))
    }()
    
    lazy private var cupsDrunkResultLabel: UILabel = {
        UILabel(text: "\(account.cupsCount)", color: .materialMedium, font: UIFont.systemFont(ofSize: 13, weight: .light))
    }()
    
    lazy private var recipesStatisticsStackView: UIStackView = {
        let recipesStatistics = UIStackView()
        recipesStatistics.distribution = .equalSpacing
        recipesStatistics.axis = .horizontal
        recipesStatistics.backgroundColor = .highlightPrimary
        recipesStatistics.layer.cornerRadius = 20
        
        recipesStatistics.addSubview(recipesMasteredLabel)
        recipesStatistics.addSubview(recipesMasteredResultLabel)
        
        return recipesStatistics
    }()
    
    lazy private var recipesMasteredLabel: UILabel = {
        UILabel(text: "Recipes mastered", color: .materialMedium, font: UIFont.systemFont(ofSize: 13, weight: .light))
    }()
    
    lazy private var recipesMasteredResultLabel: UILabel = {
        UILabel(text: "\(account.recipesCount)", color: .materialMedium, font: UIFont.systemFont(ofSize: 13, weight: .light))
    }()
    
    lazy private var healthStatisticsStackView: UIStackView = {
        let healthStatistics = UIStackView()
        healthStatistics.distribution = .equalSpacing
        healthStatistics.axis = .horizontal
        healthStatistics.backgroundColor = .highlightPrimary
        healthStatistics.layer.cornerRadius = 20
        
        healthStatistics.addSubview(healthScoreLabel)
        healthStatistics.addSubview(healthScoreResultLabel)
        
        return healthStatistics
    }()
    
    lazy private var healthScoreLabel: UILabel = {
        UILabel(text: "Health score", color: .materialMedium, font: UIFont.systemFont(ofSize: 13, weight: .light))
    }()
    
    lazy private var healthScoreResultLabel: UILabel = {
        UILabel(text: "\(account.healthScore)", color: .materialMedium, font: UIFont.systemFont(ofSize: 13, weight: .light))
    }()
    
    lazy private var userLevelLabel: UILabel = {
        UILabel(text: "\(account.level)", color: .materialHeavy, font: UIFont.systemFont(ofSize: 36, weight: .medium))
    }()
    
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
    
    init(_ account: Account, frame: CGRect) {
        self.account = account
        super.init(frame: frame)
        
        addSubview(cardStackView)
    }
    
    @available(*, unavailable)
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
