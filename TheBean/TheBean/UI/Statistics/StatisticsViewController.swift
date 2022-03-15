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
// FIXME: (AC) - Update color names according to assets folder

let account: Account = Account()

class StatisticsViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        settings()
    }
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .background
        scrollView.resizeScrollViewContentSize()
        return scrollView
    }()
    
    private lazy var personalRecomendationsBlockStackView = PersonalRecomendationsBlockStackView(recomendations: [
        ("Latte", UIImage(named: "Latte")!),
        ("Flat White", UIImage(named: "Flat")!),
        ("Americano", UIImage(named: "Americano")!)
    ])
    
    private func settings() {
        setupAppearance()
        setupSubiews()
        setupConstraints()
    }
    
    private func setupSubiews() {
        view.addSubview(scrollView)
        scrollView.addSubview(personalRecomendationsBlockStackView)
    }
    
    private func setupConstraints() {
        scrollView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(20)
            make.bottom.top.equalToSuperview()
        }
        
        personalRecomendationsBlockStackView.snp.makeConstraints { make in
            make.width.equalToSuperview()
        }
    }
    
}
//
//    // TODO: (AC) - FIX SCROLLVIEW (NEED AUTO CONTENTVIEW HEIGHT)
//
////    private lazy var contentSize = CGSize(width: self.view.frame.width, height: self.view.frame.height)
//
//    private lazy var contentView: UIView = {
//        let contentView = UIView()
//        contentView.backgroundColor = .background
////        contentView.frame.size = contentSize
//        return contentView
//    }()
//
//    private let headerStackView: UIStackView = {
//        let stackView = UIStackView()
//        stackView.distribution = .equalSpacing
//        stackView.axis = .horizontal
//        stackView.backgroundColor = .background
//        return stackView
//    }()
//
//    private let logoTheBeanImageView: UIImageView = {
//        let imageView = UIImageView()
//        let image = UIImage(named: "LogoTheBean")
//        imageView.image = image
//        imageView.clipsToBounds = true
//        imageView.contentMode = .scaleAspectFit
//        return imageView
//    }()
//
//    private let userCardStackView: UIStackView = {
//        let stackView = UIStackView()
//        stackView.distribution = .equalSpacing
//        stackView.axis = .vertical
//        stackView.backgroundColor = .highlightPrimary
//        stackView.layer.cornerRadius = 20
//        return stackView
//    }()
//
//    private let usernameStackView: UIStackView = {
//        let stackView = UIStackView()
//        stackView.distribution = .equalSpacing
//        stackView.axis = .horizontal
//        stackView.backgroundColor = .highlightPrimary
//        stackView.layer.cornerRadius = 20
//        return stackView
//    }()
//
//    private let usernameLabel: UILabel = {
//        UILabel(text: "Wane Smith", color: .materialHeavy, font: UIFont.systemFont(ofSize: 24, weight: .bold))
//    }()
//
//    private let leadPositionStackView: UIStackView = {
//        let stackView = UIStackView()
//        stackView.distribution = .equalSpacing
//        stackView.axis = .horizontal
//        stackView.backgroundColor = .background
//        return stackView
//    }()
//
//    private let globalStatisticsLabel: UILabel = {
//        UILabel(text: "Global statistics:", color: .materialHeavy, font: UIFont.systemFont(ofSize: 18, weight: .medium))
//    }()
//
//    // TODO: (AC) - highlight the application name in bold
//    private let popularDrinkLabel: UILabel = {
//        let label = UILabel(text: "Latte-is the most popular drink among The Bean users",
//                color: .materialMedium, font: UIFont.systemFont(ofSize: 16, weight: .medium))
//        label.numberOfLines = 3
//        label.textAlignment = .center
//        return label
//    }()
//
//    private let averageNumberLabel: UILabel = {
//        let label =  UILabel(text: "4-is an average number of cups per day",
//        color: .white, font: UIFont.systemFont(ofSize: 16, weight: .medium))
//        label.numberOfLines = 2
//        label.textAlignment = .center
//        return label
//    }()
//
//    // TODO: (AC) - highlight the application name in bold
//    private let recipesAppLabel: UILabel = {
//        let label =  UILabel(text: "129 recipes are mastered by The Bean users",
//        color: .white, font: UIFont.systemFont(ofSize: 16, weight: .medium))
//        label.numberOfLines = 2
//        label.textAlignment = .center
//        return label
//    }()
//
//    private let popularDrinkStackView: UIStackView = {
//        let stackView = UIStackView()
//        stackView.distribution = .equalSpacing
//        stackView.axis = .horizontal
//        stackView.backgroundColor = .highlightPrimary
//        stackView.layer.cornerRadius = 20
//        return stackView
//    }()
//
//    private let baristaHandsImageView: UIImageView = {
//        let imageView = UIImageView()
//        let image = UIImage(named: "BaristaHands")
//        imageView.image = image
//        imageView.clipsToBounds = true
//        imageView.contentMode = .scaleAspectFit
//        return imageView
//    }()
//
//    private let averageNumberCupsStackView: UIStackView = {
//        let stackView = UIStackView()
//        stackView.distribution = .equalSpacing
//        stackView.axis = .horizontal
//        stackView.backgroundColor = .materialHeavy
//        stackView.layer.cornerRadius = 20
//        return stackView
//    }()
//
//    private let averageNumberCupsInternalStackView: UIStackView = {
//        let stackView = UIStackView()
//        stackView.distribution = .equalSpacing
//        stackView.axis = .horizontal
//        stackView.backgroundColor = .materialLight
//        stackView.layer.cornerRadius = 20
//        return stackView
//    }()
//
//    // TODO: (AC) - check cups size (maybe need to increase)
//    private let firstCupCoffeeImageView: UIImageView = {
//        let imageView = UIImageView()
//        let image = UIImage(named: "Cup")
//        imageView.image = image
//        imageView.clipsToBounds = true
//        imageView.contentMode = .scaleAspectFit
//        return imageView
//    }()
//
//    private let secondCupCoffeeImageView: UIImageView = {
//        let imageView = UIImageView()
//        let image = UIImage(named: "Cup")
//        imageView.image = image
//        imageView.clipsToBounds = true
//        imageView.contentMode = .scaleAspectFit
//        return imageView
//    }()
//
//    private let thirdCupCoffeeImageView: UIImageView = {
//        let imageView = UIImageView()
//        let image = UIImage(named: "Cup")
//        imageView.image = image
//        imageView.clipsToBounds = true
//        imageView.contentMode = .scaleAspectFit
//        return imageView
//    }()
//
//    private let fourthCupCoffeeImageView: UIImageView = {
//        let imageView = UIImageView()
//        let image = UIImage(named: "Cup")
//        imageView.image = image
//        imageView.clipsToBounds = true
//        imageView.contentMode = .scaleAspectFit
//        return imageView
//    }()
//
//    private let recipesAppStackView: UIStackView = {
//        let stackView = UIStackView()
//        stackView.distribution = .equalSpacing
//        stackView.axis = .horizontal
//        stackView.backgroundColor = .highlightPrimary
//        stackView.layer.cornerRadius = 20
//        return stackView
//    }()
//
//    private let recipesAppCoffeeBeanImageView: UIImageView = {
//        let imageView = UIImageView()
//        let image = UIImage(named: "CoffeeBean")
//        imageView.image = image
//        imageView.clipsToBounds = true
//        imageView.contentMode = .scaleAspectFit
//        return imageView
//    }()
//
//    private let recipesAppCoffeeMilkImageView: UIImageView = {
//        let imageView = UIImageView()
//        let image = UIImage(named: "CoffeeMilk")
//        imageView.image = image
//        imageView.clipsToBounds = true
//        imageView.contentMode = .scaleAspectFit
//        return imageView
//    }()
//
//    lazy private var accountStatistics: UIView = {
//        AccountStatisticsCardView(account, frame: .zero)
//    }()
//
//    private func setupConstraints() {
//
//        contentView.snp.makeConstraints { make in
//            make.edges.equalToSuperview()
//            make.width.equalTo(scrollView)
//            make.height.equalToSuperview()
//        }
//
//        headerStackView.snp.makeConstraints { make in
//            make.top.equalTo(contentView)
//            make.width.equalTo(contentView)
//            make.height.equalTo(95)
//        }
//
//        logoTheBeanImageView.snp.makeConstraints { make in
//            make.width.equalTo(39)
//            make.height.equalTo(39)
//            make.top.equalTo(35)
//            make.left.equalTo(26)
//        }
//
//        userCardStackView.snp.makeConstraints { make in
//            make.height.equalTo(212)
//            make.width.equalTo(315)
//            make.top.equalTo(headerStackView.snp.bottom).inset(-9)
//            make.centerX.equalTo(contentView)
//        }
//
//        usernameStackView.snp.makeConstraints { make in
//            make.height.equalTo(64)
//            make.width.equalTo(userCardStackView)
//            make.centerX.equalTo(userCardStackView)
//        }
//
//        usernameLabel.snp.makeConstraints { make in
//            make.top.equalTo(20)
//            make.left.equalTo(23)
//        }
//
////        userDataStackView.snp.makeConstraints { make in
////            make.height.equalTo(148)
////            make.width.equalTo(userCardStackView)
////            make.top.equalTo(64)
////            make.centerX.equalTo(userCardStackView)
////        }
////
////        userCoffeeDataStackView.snp.makeConstraints { make in
////            make.height.equalTo(userDataStackView)
////            make.width.equalTo(165)
////        }
////
////        scoreLabel.snp.makeConstraints { make in
////            make.left.equalTo(23)
////        }
////
////        cupsDrunkLabel.snp.makeConstraints { make in
////            make.top.equalTo(scoreLabel.snp.bottom).inset(-20)
////            make.left.equalTo(23)
////        }
////
////        cupsDrunkLabelResult.snp.makeConstraints { make in
////            make.top.equalTo(scoreLabel.snp.bottom).inset(-20)
////            make.left.equalTo(cupsDrunkLabel.snp.right).inset(-58)
////        }
////
////        recipesMasteredLabel.snp.makeConstraints { make in
////            make.top.equalTo(cupsDrunkLabel.snp.bottom).inset(-12)
////            make.left.equalTo(23)
////        }
////
////        recipesMasteredLabelResult.snp.makeConstraints { make in
////            make.top.equalTo(cupsDrunkLabel.snp.bottom).inset(-12)
////            make.left.equalTo(cupsDrunkLabel.snp.right).inset(-58)
////        }
////
////        healthScoreLabel.snp.makeConstraints { make in
////            make.top.equalTo(recipesMasteredLabel.snp.bottom).inset(-12)
////            make.left.equalTo(23)
////        }
////
////        healthScoreLabelResult.snp.makeConstraints { make in
////            make.top.equalTo(recipesMasteredLabel.snp.bottom).inset(-12)
////            make.left.equalTo(cupsDrunkLabel.snp.right).inset(-58)
////        }
////
////        userLevelStackView.snp.makeConstraints { make in
////            make.height.equalTo(userDataStackView)
////            make.width.equalTo(145)
////            make.left.equalTo(170)
////        }
////
////        userLevelImageView.snp.makeConstraints { make in
////            make.width.equalTo(88)
////            make.height.equalTo(81)
////            make.bottom.equalTo(-36)
////            make.right.equalTo(-23)
////        }
////
////        insideCircleImageView.snp.makeConstraints { make in
////            make.width.equalTo(75)
////            make.height.equalTo(68)
////            make.centerX.equalTo(userLevelImageView)
////            make.centerY.equalTo(userLevelImageView)
////        }
////
////        userLevelLabel.snp.makeConstraints { make in
////            make.centerX.equalTo(userLevelImageView)
////            make.centerY.equalTo(userLevelImageView)
////        }
//
//        globalStatisticsLabel.snp.makeConstraints { make in
//            make.top.equalTo(leadPositionStackView.snp.bottom).inset(-43)
//            make.left.equalTo(30)
//        }
//
//        popularDrinkStackView.snp.makeConstraints { make in
//            make.top.equalTo(globalStatisticsLabel.snp.bottom).inset(-18)
//            make.centerX.equalTo(contentView)
//            make.width.equalTo(315)
//            make.height.equalTo(192)
//        }
//
//        baristaHandsImageView.snp.makeConstraints { make in
//            make.width.equalTo(110)
//            make.height.equalTo(165)
//            make.top.equalTo(14)
//            make.left.equalTo(18)
//        }
//
//        popularDrinkLabel.snp.makeConstraints { make in
//            make.top.equalTo(57)
//            make.left.equalTo(baristaHandsImageView.snp.right).inset(-14)
//            make.right.equalTo(-18)
//        }
//
//        averageNumberCupsStackView.snp.makeConstraints { make in
//            make.top.equalTo(popularDrinkStackView.snp.bottom).inset(-8)
//            make.centerX.equalTo(contentView)
//            make.width.equalTo(315)
//            make.height.equalTo(192)
//        }
//
//        averageNumberCupsInternalStackView.snp.makeConstraints { make in
//            make.top.equalTo(125)
//            make.width.equalTo(315)
//            make.height.equalTo(75)
//            make.centerX.equalTo(averageNumberCupsStackView)
//        }
//
//        averageNumberLabel.snp.makeConstraints { make in
//            make.top.equalTo(27)
//            make.left.equalTo(68)
//            make.right.equalTo(-67)
//        }
//
//        // TODO: (AC) - correct cups size (they are small on screen) and fix code repetition
//        firstCupCoffeeImageView.snp.makeConstraints { make in
//            make.width.equalTo(55)
//            make.height.equalTo(73)
//            make.top.equalTo(96)
//            make.left.equalTo(21)
//        }
//
//        secondCupCoffeeImageView.snp.makeConstraints { make in
//            make.width.equalTo(55)
//            make.height.equalTo(73)
//            make.top.equalTo(96)
//            make.left.equalTo(firstCupCoffeeImageView.snp.right).inset(-17)
//        }
//
//        thirdCupCoffeeImageView.snp.makeConstraints { make in
//            make.width.equalTo(55)
//            make.height.equalTo(73)
//            make.top.equalTo(96)
//            make.left.equalTo(secondCupCoffeeImageView.snp.right).inset(-17)
//        }
//
//        fourthCupCoffeeImageView.snp.makeConstraints { make in
//            make.width.equalTo(55)
//            make.height.equalTo(73)
//            make.top.equalTo(96)
//            make.right.equalTo(-23)
//        }
//
//        recipesAppStackView.snp.makeConstraints { make in
//            make.top.equalTo(averageNumberCupsInternalStackView.snp.bottom).inset(-8)
//            make.centerX.equalTo(contentView)
//            make.width.equalTo(315)
//            make.height.equalTo(192)
//        }
//
//        recipesAppLabel.snp.makeConstraints { make in
//            make.top.equalTo(27)
//            make.left.equalTo(64)
//            make.right.equalTo(-62)
//        }
//
//        recipesAppCoffeeBeanImageView.snp.makeConstraints { make in
//            make.width.equalTo(125)
//            make.height.equalTo(118)
//            make.top.equalTo(65)
//        }
//
//        recipesAppCoffeeMilkImageView.snp.makeConstraints { make in
//            make.width.equalTo(125)
//            make.height.equalTo(108)
//            make.top.equalTo(70)
//            make.left.equalTo(recipesAppCoffeeBeanImageView.snp.right).inset(-65)
//        }
//
//        scrollView.resizeScrollViewContentSize()
//    }
//
//}
