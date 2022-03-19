////
////  StatisticsStackView.swift
////  TheBean
////
////  Created by Daniel Pustotin on 13.03.2022.
////
//
//import UIKit
//
//class StatisticsStackView: UIStackView {
//    lazy private var statisticsStackView: UIStackView = {
//        let statistics = UIStackView()
//        statistics.distribution = .equalSpacing
//        statistics.axis = .vertical
//        statistics.backgroundColor = .highlightPrimary
//        statistics.layer.cornerRadius = 20
//        
//        statistics.addSubview(cupsStatisticsStackView)
//        statistics.addSubview(recipesStatisticsStackView)
//        statistics.addSubview(healthStatisticsStackView)
//        
//        return statistics
//    }()
//
//    // MARK: - Cups
//    lazy private var cupsStatisticsStackView: UIStackView = {
//        let cupsStatistics = UIStackView()
//        cupsStatistics.distribution = .equalSpacing
//        cupsStatistics.axis = .horizontal
//        cupsStatistics.backgroundColor = .highlightPrimary
//        cupsStatistics.layer.cornerRadius = 20
//        
//        cupsStatistics.addSubview(cupsLabel)
//        cupsStatistics.addSubview(cupsResultLabel)
//        
//        return cupsStatistics
//    }()
//
//    lazy private var cupsLabel: UILabel = {
//        UILabel(text: "Cups drunk", color: .materialMedium, font: UIFont.systemFont(ofSize: 13, weight: .light))
//    }()
//
//    lazy private var cupsResultLabel: UILabel = {
//        UILabel(text: "\(account.cupsCount)", color: .materialMedium, font: UIFont.systemFont(ofSize: 13, weight: .light))
//    }()
//
//    // MARK: - Recipes
//    lazy private var recipesStatisticsStackView: UIStackView = {
//        let recipesStatistics = UIStackView()
//        recipesStatistics.distribution = .equalSpacing
//        recipesStatistics.axis = .horizontal
//        recipesStatistics.backgroundColor = .highlightPrimary
//        recipesStatistics.layer.cornerRadius = 20
//        
//        recipesStatistics.addSubview(recipesLabel)
//        recipesStatistics.addSubview(recipesResultLabel)
//        
//        return recipesStatistics
//    }()
//
//    lazy private var recipesLabel: UILabel = {
//        UILabel(text: "Recipes mastered", color: .materialMedium, font: UIFont.systemFont(ofSize: 13, weight: .light))
//    }()
//
//    lazy private var recipesResultLabel: UILabel = {
//        UILabel(text: "\(account.recipesCount)", color: .materialMedium, font: UIFont.systemFont(ofSize: 13, weight: .light))
//    }()
//    
//    // MARK: - Health
//    lazy private var healthStatisticsStackView: UIStackView = {
//        let healthStatistics = UIStackView()
//        healthStatistics.distribution = .equalSpacing
//        healthStatistics.axis = .horizontal
//        healthStatistics.backgroundColor = .highlightPrimary
//        healthStatistics.layer.cornerRadius = 20
//        
//        healthStatistics.addSubview(healthScoreLabel)
//        healthStatistics.addSubview(healthScoreResultLabel)
//        
//        return healthStatistics
//    }()
//    
//    lazy private var healthScoreLabel: UILabel = {
//        UILabel(text: "Health score", color: .materialMedium, font: UIFont.systemFont(ofSize: 13, weight: .light))
//    }()
//
//    lazy private var healthScoreResultLabel: UILabel = {
//        UILabel(text: "\(account.healthScore)", color: .materialMedium, font: UIFont.systemFont(ofSize: 13, weight: .light))
//    }()
//}
