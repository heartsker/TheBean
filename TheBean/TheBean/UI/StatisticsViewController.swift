//
//  StatisticsViewController.swift
//  TheBean
//
//  Created by Alina on 10.02.2022.
//

import UIKit
import SnapKit

class StatisticsViewController: UIViewController {
    
    private let scrollView = UIScrollView()
    private let contentView = UIView()

    private let headerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
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
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .equalSpacing
        stackView.axis = .vertical
        stackView.backgroundColor = .highlightPrimary
        stackView.layer.cornerRadius = 20
        return stackView
    }()
    
    private let usernameStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .equalSpacing
        stackView.axis = .horizontal
        stackView.backgroundColor = .highlightPrimary
        stackView.layer.cornerRadius = 20
        return stackView
    }()
    
    private let usernameLabel: UILabel = {
        let label = UILabel()
        label.text = "Wane Smith"
        label.textColor = .black
        // TODO: (AC) - Replace UIFont inits with constants for our app - in UIFont extension
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        return label
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
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .equalSpacing
        stackView.axis = .horizontal
        stackView.backgroundColor = .highlightPrimary
        stackView.layer.cornerRadius = 20
        return stackView
    }()
    
    private let userCoffeeDataStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .equalSpacing
        stackView.axis = .vertical
        stackView.backgroundColor = .highlightPrimary
        stackView.layer.cornerRadius = 20
        return stackView
    }()
    
    private let scoreLabel: UILabel = {
        let label = UILabel()
        label.text = "Score"
        label.textColor = .materialSecondary
        // TODO: (AC) - Replace UIFont inits with constants for our app - in UIFont extension
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        return label
    }()
    
    private let cupsDrunkLabel: UILabel = {
        let label = UILabel()
        label.text = "Cups drunk"
        label.textColor = .materialSecondary
        // TODO: (AC) - Replace UIFont inits with constants for our app - in UIFont extension
        label.font = UIFont.systemFont(ofSize: 13, weight: .medium)
        return label
    }()
    
    private let cupsDrunkLabelResult: UILabel = {
        let label = UILabel()
        label.text = "54"
        label.textColor = .materialSecondary
        // TODO: (AC) - Replace UIFont inits with constants for our app - in UIFont extension
        label.font = UIFont.systemFont(ofSize: 13, weight: .medium)
        return label
    }()
    
    private let recipesMasteredLabel: UILabel = {
        let label = UILabel()
        label.text = "Recipes mastered"
        label.textColor = .materialSecondary
        // TODO: (AC) - Replace UIFont inits with constants for our app - in UIFont extension
        label.font = UIFont.systemFont(ofSize: 13, weight: .medium)
        return label
    }()
    
    private let recipesMasteredLabelResult: UILabel = {
        let label = UILabel()
        label.text = "24"
        label.textColor = .materialSecondary
        // TODO: (AC) - Replace UIFont inits with constants for our app - in UIFont extension
        label.font = UIFont.systemFont(ofSize: 13, weight: .medium)
        return label
    }()
    
    private let healthScoreLabel: UILabel = {
        let label = UILabel()
        label.text = "Health score"
        label.textColor = .materialSecondary
        // TODO: (AC) - Replace UIFont inits with constants for our app - in UIFont extension
        label.font = UIFont.systemFont(ofSize: 13, weight: .medium)
        return label
    }()
    
    private let healthScoreLabelResult: UILabel = {
        let label = UILabel()
        label.text = "38"
        label.textColor = .materialSecondary
        // TODO: (AC) - Replace UIFont inits with constants for our app - in UIFont extension
        label.font = UIFont.systemFont(ofSize: 13, weight: .medium)
        return label
    }()
    
    private let userLevelStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .equalSpacing
        stackView.axis = .vertical
        stackView.backgroundColor = .highlightPrimary
        stackView.layer.cornerRadius = 20
        return stackView
    }()
    
    // !!! I don't know how to do it:
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
        let label = UILabel()
        label.text = "39"
        label.textColor = .black
        // TODO: (AC) - Replace UIFont inits with constants for our app - in UIFont extension
        label.font = UIFont.systemFont(ofSize: 36, weight: .medium)
        return label
    }()
    
    // TODO: (AC) - There is a ton of duplicating code here. Should consider replacing it with UILabel extension.
    private let recommendationsLabel: UILabel = {
        let label = UILabel()
        label.text = "Personal recommendations:"
        label.textColor = .black
        // TODO: (AC) - Replace UIFont inits with constants for our app - in UIFont extension
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        return label
    }()
    
    private let leadPositionStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
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
        let label = UILabel()
        label.text = "Latte"
        label.textColor = .black
        // TODO: (AC) - Replace UIFont inits with constants for our app - in UIFont extension
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        return label
    }()
    
    private let flatLabel: UILabel = {
        let label = UILabel()
        label.text = "Flat white"
        label.textColor = .black
        // TODO: (AC) - Replace UIFont inits with constants for our app - in UIFont extension
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        return label
    }()
    
    private let americanoLabel: UILabel = {
        let label = UILabel()
        label.text = "Americano"
        label.textColor = .black
        // TODO: (AC) - Replace UIFont inits with constants for our app - in UIFont extension
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        return label
    }()
    
    private let globalStatisticsLabel: UILabel = {
        let label = UILabel()
        label.text = "Global statistics:"
        // TODO: (AC) - replace colors using new UIColor extension with our app color theme
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        return label
    }()
    
    private let popularDrinkStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .equalSpacing
        stackView.axis = .horizontal
        stackView.backgroundColor = .highlightPrimary
        stackView.layer.cornerRadius = 20
        return stackView
    }()
    
    private let averageNumberStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .equalSpacing
        stackView.axis = .horizontal
        stackView.backgroundColor = .highlightPrimary
        stackView.layer.cornerRadius = 20
        return stackView
    }()
    
    private let recipesAppStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
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
        
        headerStackView.addSubview(logoTheBeanImageView)
        
        contentView.addSubview(headerStackView)
        contentView.addSubview(userCardStackView)
        contentView.addSubview(recommendationsLabel)
        contentView.addSubview(leadPositionStackView)
        contentView.addSubview(globalStatisticsLabel)
        contentView.addSubview(popularDrinkStackView)
        contentView.addSubview(averageNumberStackView)
        contentView.addSubview(recipesAppStackView)
        
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
        
    }
    
    private func setupConstraints() {
        scrollView.snp.makeConstraints { (make) in
            make.edges.equalTo(view)
        }
        
        contentView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalTo(self.scrollView)
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
            make.top.equalTo(35)
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
        
        averageNumberStackView.snp.makeConstraints { make in
            make.top.equalTo(popularDrinkStackView.snp.bottom).inset(-8)
            make.centerX.equalTo(contentView)
            make.width.equalTo(315)
            make.height.equalTo(192)
        }
        
        recipesAppStackView.snp.makeConstraints { make in
            make.top.equalTo(averageNumberStackView.snp.bottom).inset(-8)
            make.centerX.equalTo(contentView)
            make.width.equalTo(315)
            make.height.equalTo(192)
        }
    }
    
}
