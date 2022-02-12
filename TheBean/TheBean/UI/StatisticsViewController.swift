//
//  StatisticsViewController.swift
//  TheBean
//
//  Created by Alina on 10.02.2022.
//

import UIKit
import SnapKit

// TODO: (AC) - Replace UIFont inits with constants for our app - in UIFont extension
// FIXME: (AC) - Too many views - should consider inheritance structure for views.

class StatisticsViewController: UIViewController {
    
    private lazy var contentSize = CGSize(width: self.view.frame.width, height: self.view.frame.height + 800)
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .background
        scrollView.contentSize = contentSize
        return scrollView
    }()
    
    private lazy var contentView: UIView = {
        let contentView = UIView()
        contentView.backgroundColor = .background
        contentView.frame.size = contentSize
        return contentView
    }()

    private let headerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .equalSpacing
        stackView.axis = .horizontal
        stackView.backgroundColor = .background
        return stackView
    }()
    
    private let logoTheBeanImageView: UIImageView = {
        let imageView = UIImageView()
        let image = UIImage(named: "LogoTheBean")
        imageView.image = image
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let userCardStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .equalSpacing
        stackView.axis = .vertical
        stackView.backgroundColor = .highlightPrimary
        stackView.layer.cornerRadius = 20
        return stackView
    }()
    
    private let usernameStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .equalSpacing
        stackView.axis = .horizontal
        stackView.backgroundColor = .highlightPrimary
        stackView.layer.cornerRadius = 20
        return stackView
    }()
    
    private let usernameLabel: UILabel = {
        UILabel("Wane Smith", color: .materialHeavy, font: UIFont.systemFont(ofSize: 24, weight: .bold))
    }()
    
    private let avatarImageView: UIImageView = {
        let imageView = UIImageView()
        let image = UIImage(named: "Avatar")
        imageView.image = image
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let userDataStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .equalSpacing
        stackView.axis = .horizontal
        stackView.backgroundColor = .highlightPrimary
        stackView.layer.cornerRadius = 20
        return stackView
    }()
    
    private let userCoffeeDataStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .equalSpacing
        stackView.axis = .vertical
        stackView.backgroundColor = .highlightPrimary
        stackView.layer.cornerRadius = 20
        return stackView
    }()
    
    private let scoreLabel: UILabel = {
        UILabel("Score", color: .materialMedium, font: UIFont.systemFont(ofSize: 18, weight: .bold))
    }()
    
    private let cupsDrunkLabel: UILabel = {
        UILabel("Cups drunk", color: .materialMedium, font: UIFont.systemFont(ofSize: 13, weight: .medium))
    }()
    
    private let cupsDrunkLabelResult: UILabel = {
        UILabel("54", color: .materialMedium, font: UIFont.systemFont(ofSize: 13, weight: .medium))
    }()
    
    private let recipesMasteredLabel: UILabel = {
        UILabel("Recipes mastered", color: .materialMedium, font: UIFont.systemFont(ofSize: 13, weight: .medium))
    }()
    
    private let recipesMasteredLabelResult: UILabel = {
        UILabel("24", color: .materialMedium, font: UIFont.systemFont(ofSize: 13, weight: .medium))
    }()
    
    private let healthScoreLabel: UILabel = {
        UILabel("Health score", color: .materialMedium, font: UIFont.systemFont(ofSize: 13, weight: .medium))
    }()
    
    private let healthScoreLabelResult: UILabel = {
        UILabel("38", color: .materialMedium, font: UIFont.systemFont(ofSize: 13, weight: .medium))
    }()
    
    private let userLevelStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .equalSpacing
        stackView.axis = .vertical
        stackView.backgroundColor = .highlightPrimary
        stackView.layer.cornerRadius = 20
        return stackView
    }()
    
    // !!! FIX: I don't know how to do it:
    private let userLevelImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .accentColor
        imageView.frame.size.height = 81
        imageView.layer.cornerRadius = imageView.frame.height/2
        return imageView
    }()
    
    private let insideCircleImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .highlightPrimary
        imageView.frame.size.height = 68
        imageView.layer.cornerRadius = imageView.frame.height/2
        return imageView
    }()
    
    private let userLevelLabel: UILabel = {
        UILabel("39", color: .materialMedium, font: UIFont.systemFont(ofSize: 36, weight: .medium))
    }()
    
    private let recommendationsLabel: UILabel = {
        UILabel("Personal recommendations:", color: .materialHeavy, font: UIFont.systemFont(ofSize: 18, weight: .medium))
    }()
    
    private let leadPositionStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .equalSpacing
        stackView.axis = .horizontal
        stackView.backgroundColor = .background
        return stackView
    }()
    
    private let latteImageView: UIImageView = {
        let imageView = UIImageView()
        let image = UIImage(named: "Latte")
        imageView.image = image
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let flatImageView: UIImageView = {
        let imageView = UIImageView()
        let image = UIImage(named: "Flat")
        imageView.image = image
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let americanoImageView: UIImageView = {
        let imageView = UIImageView()
        let image = UIImage(named: "Americano")
        imageView.image = image
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let latteLabel: UILabel = {
        UILabel("Latte", color: .materialHeavy, font: UIFont.systemFont(ofSize: 14, weight: .medium))
    }()
    
    private let flatLabel: UILabel = {
        UILabel("Flat white", color: .materialHeavy, font: UIFont.systemFont(ofSize: 14, weight: .medium))
    }()
    
    private let americanoLabel: UILabel = {
        UILabel("Americano", color: .materialHeavy, font: UIFont.systemFont(ofSize: 14, weight: .medium))
    }()
    
    private let globalStatisticsLabel: UILabel = {
        UILabel("Global statistics:", color: .materialHeavy, font: UIFont.systemFont(ofSize: 14, weight: .medium))
    }()
    
    private let popularDrinkStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .equalSpacing
        stackView.axis = .horizontal
        stackView.backgroundColor = .highlightPrimary
        stackView.layer.cornerRadius = 20
        return stackView
    }()
    
    private let baristaHandsImageView: UIImageView = {
        let imageView = UIImageView()
        let image = UIImage(named: "BaristaHands")
        imageView.image = image
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let popularDrinkLabel: UILabel = {
        UILabel("Latte-is the most popular drink among The Bean users",
                color: .materialMedium, font: UIFont.systemFont(ofSize: 16, weight: .medium))
    }()
    
    private let averageNumberCupsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .equalSpacing
        stackView.axis = .horizontal
        stackView.backgroundColor = .materialHeavy
        stackView.layer.cornerRadius = 20
        return stackView
    }()
    
    private let averageNumberCupsInternalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .equalSpacing
        stackView.axis = .horizontal
        stackView.backgroundColor = .materialHeavy
        stackView.layer.cornerRadius = 20
        return stackView
    }()
    
    private let averageNumberLabel: UILabel = {
        let label = UILabel()
        label.text = "4-is an average number of cups per day"
        label.textColor = .white
        label.font = UIFont.mullerMedium
        label.font = label.font.withSize(16)
        return label
    }()
    
    private let recipesAppStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .equalSpacing
        stackView.axis = .horizontal
        stackView.backgroundColor = .highlightPrimary
        stackView.layer.cornerRadius = 20
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupAppearance()
        
        setupSubiews()
        setupConstraints()
    }
    
    private func setupSubiews() {
        view.addSubview(scrollView)
        
        scrollView.addSubview(contentView)
        
        contentView.addSubview(headerStackView)
        contentView.addSubview(userCardStackView)
        contentView.addSubview(recommendationsLabel)
        contentView.addSubview(leadPositionStackView)
        contentView.addSubview(globalStatisticsLabel)
        contentView.addSubview(popularDrinkStackView)
        contentView.addSubview(averageNumberCupsStackView)
        contentView.addSubview(recipesAppStackView)
        
        headerStackView.addSubview(logoTheBeanImageView)
        
        userCardStackView.addSubview(usernameStackView)
        userCardStackView.addSubview(userDataStackView)
        
        usernameStackView.addSubview(usernameLabel)
        usernameStackView.addSubview(avatarImageView)
        
        userDataStackView.addSubview(userCoffeeDataStackView)
        userDataStackView.addSubview(userLevelStackView)
        
        userCoffeeDataStackView.addSubview(scoreLabel)
        userCoffeeDataStackView.addSubview(cupsDrunkLabel)
        userCoffeeDataStackView.addSubview(cupsDrunkLabelResult)
        userCoffeeDataStackView.addSubview(recipesMasteredLabel)
        userCoffeeDataStackView.addSubview(recipesMasteredLabelResult)
        userCoffeeDataStackView.addSubview(healthScoreLabel)
        userCoffeeDataStackView.addSubview(healthScoreLabelResult)
        
        userLevelStackView.addSubview(userLevelImageView)
        userLevelImageView.addSubview(insideCircleImageView)
        insideCircleImageView.addSubview(userLevelLabel)
        
        leadPositionStackView.addSubview(latteImageView)
        leadPositionStackView.addSubview(flatImageView)
        leadPositionStackView.addSubview(americanoImageView)
        leadPositionStackView.addSubview(latteLabel)
        leadPositionStackView.addSubview(flatLabel)
        leadPositionStackView.addSubview(americanoLabel)
        
        popularDrinkStackView.addSubview(baristaHandsImageView)
        popularDrinkStackView.addSubview(popularDrinkLabel)
        
        averageNumberCupsStackView.addSubview(averageNumberCupsInternalStackView)
        averageNumberCupsStackView.addSubview(averageNumberLabel)
    }
    
    private func setupConstraints() {
        scrollView.snp.makeConstraints { (make) in
            make.edges.equalTo(view)
        }
        
        contentView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalTo(scrollView)
            make.height.equalToSuperview()
        }
        
        headerStackView.snp.makeConstraints { make in
            make.top.equalTo(contentView)
            make.width.equalTo(contentView)
            make.height.equalTo(95)
        }
        
        logoTheBeanImageView.snp.makeConstraints { make in
            make.width.equalTo(39)
            make.height.equalTo(39)
            make.top.equalTo(35)
            make.left.equalTo(26)
        }
        
        userCardStackView.snp.makeConstraints { make in
            make.height.equalTo(212)
            make.width.equalTo(315)
            make.top.equalTo(headerStackView.snp.bottom).inset(-9)
            make.centerX.equalTo(contentView)
        }
        
        usernameStackView.snp.makeConstraints { make in
            make.height.equalTo(64)
            make.width.equalTo(userCardStackView)
            make.centerX.equalTo(userCardStackView)
        }
        
        usernameLabel.snp.makeConstraints { make in
            make.top.equalTo(20)
            make.left.equalTo(23)
        }
        
        avatarImageView.snp.makeConstraints { make in
            make.width.equalTo(54)
            make.height.equalTo(54)
            make.top.equalTo(12)
            make.right.equalTo(-40)
        }
        
        userDataStackView.snp.makeConstraints { make in
            make.height.equalTo(148)
            make.width.equalTo(userCardStackView)
            make.top.equalTo(64)
            make.centerX.equalTo(userCardStackView)
        }
        
        userCoffeeDataStackView.snp.makeConstraints { make in
            make.height.equalTo(userDataStackView)
            make.width.equalTo(165)
        }
        
        scoreLabel.snp.makeConstraints { make in
            make.left.equalTo(23)
        }
        
        cupsDrunkLabel.snp.makeConstraints { make in
            make.top.equalTo(scoreLabel.snp.bottom).inset(-20)
            make.left.equalTo(23)
        }
        
        cupsDrunkLabelResult.snp.makeConstraints { make in
            make.top.equalTo(scoreLabel.snp.bottom).inset(-20)
            make.left.equalTo(cupsDrunkLabel.snp.right).inset(-58)
        }
        
        recipesMasteredLabel.snp.makeConstraints { make in
            make.top.equalTo(cupsDrunkLabel.snp.bottom).inset(-12)
            make.left.equalTo(23)
        }
        
        recipesMasteredLabelResult.snp.makeConstraints { make in
            make.top.equalTo(cupsDrunkLabel.snp.bottom).inset(-12)
            make.left.equalTo(cupsDrunkLabel.snp.right).inset(-58)
        }
        
        healthScoreLabel.snp.makeConstraints { make in
            make.top.equalTo(recipesMasteredLabel.snp.bottom).inset(-12)
            make.left.equalTo(23)
        }
        
        healthScoreLabelResult.snp.makeConstraints { make in
            make.top.equalTo(recipesMasteredLabel.snp.bottom).inset(-12)
            make.left.equalTo(cupsDrunkLabel.snp.right).inset(-58)
        }
        
        userLevelStackView.snp.makeConstraints { make in
            make.height.equalTo(userDataStackView)
            make.width.equalTo(145)
            make.left.equalTo(170)
        }
        
        userLevelImageView.snp.makeConstraints { make in
            make.width.equalTo(88)
            make.height.equalTo(81)
            make.bottom.equalTo(-36)
            make.right.equalTo(-23)
        }
        
        insideCircleImageView.snp.makeConstraints { make in
            make.width.equalTo(75)
            make.height.equalTo(68)
            make.centerX.equalTo(userLevelImageView)
            make.centerY.equalTo(userLevelImageView)
        }
        
        userLevelLabel.snp.makeConstraints { make in
            make.centerX.equalTo(userLevelImageView)
            make.centerY.equalTo(userLevelImageView)
        }
        
        recommendationsLabel.snp.makeConstraints { make in
            make.top.equalTo(userCardStackView.snp.bottom).inset(-40)
            make.left.equalTo(30)
        }
        
        leadPositionStackView.snp.makeConstraints { make in
            make.top.equalTo(recommendationsLabel.snp.bottom).inset(-18)
            make.centerX.equalTo(contentView)
            make.width.equalTo(contentView)
            make.height.equalTo(105)
        }
        
        latteImageView.snp.makeConstraints { make in
            make.width.equalTo(88)
            make.height.equalTo(83)
            make.left.equalTo(30)
        }
        
        flatImageView.snp.makeConstraints { make in
            make.width.equalTo(88)
            make.height.equalTo(83)
            make.left.equalTo(latteImageView.snp.right).inset(-30)
        }
        
        americanoImageView.snp.makeConstraints { make in
            make.width.equalTo(88)
            make.height.equalTo(83)
            make.left.equalTo(flatImageView.snp.right).inset(-30)
        }
        
        latteLabel.snp.makeConstraints { make in
            make.top.equalTo(latteImageView.snp.bottom).inset(-8)
            make.centerX.equalTo(latteImageView)
        }
        
        flatLabel.snp.makeConstraints { make in
            make.top.equalTo(flatImageView.snp.bottom).inset(-8)
            make.centerX.equalTo(flatImageView)
        }
        
        americanoLabel.snp.makeConstraints { make in
            make.top.equalTo(americanoImageView.snp.bottom).inset(-8)
            make.centerX.equalTo(americanoImageView)
        }
        
        globalStatisticsLabel.snp.makeConstraints { make in
            make.top.equalTo(leadPositionStackView.snp.bottom).inset(-43)
            make.left.equalTo(30)
        }
        
        popularDrinkStackView.snp.makeConstraints { make in
            make.top.equalTo(globalStatisticsLabel.snp.bottom).inset(-18)
            make.centerX.equalTo(contentView)
            make.width.equalTo(315)
            make.height.equalTo(192)
        }
        
        baristaHandsImageView.snp.makeConstraints { make in
            make.width.equalTo(110)
            make.height.equalTo(165)
            make.top.equalTo(14)
            make.left.equalTo(18)
        }
        
        popularDrinkLabel.snp.makeConstraints { make in
            make.top.equalTo(57)
            make.left.equalTo(baristaHandsImageView.snp.right).inset(14)
        }
        
        averageNumberCupsStackView.snp.makeConstraints { make in
            make.top.equalTo(popularDrinkStackView.snp.bottom).inset(-8)
            make.centerX.equalTo(contentView)
            make.width.equalTo(315)
            make.height.equalTo(192)
        }
        
        averageNumberCupsInternalStackView.snp.makeConstraints { make in
            make.top.equalTo(125)
            make.width.equalTo(315)
            make.height.equalTo(75)
            make.centerX.equalTo(averageNumberCupsStackView)
        }
        
        averageNumberLabel.snp.makeConstraints { make in
            make.top.equalTo(27)
            make.centerX.equalTo(averageNumberCupsStackView)
        }
        
        recipesAppStackView.snp.makeConstraints { make in
            make.top.equalTo(averageNumberCupsStackView.snp.bottom).inset(-8)
            make.centerX.equalTo(contentView)
            make.width.equalTo(315)
            make.height.equalTo(192)
        }
    }
    
}
