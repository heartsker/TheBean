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
        stackView.backgroundColor = UIColor(red: 223/255, green: 197/255, blue: 175/255, alpha: 1)
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
    
    private let userInfoStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .equalSpacing
        stackView.axis = .horizontal
        stackView.backgroundColor = UIColor(red: 223/255, green: 197/255, blue: 175/255, alpha: 1)
        stackView.layer.cornerRadius = 20
        return stackView
    }()
    
    private let recommendationsLabel: UILabel = {
        let label = UILabel()
        label.text = "Personal recommendations:"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        return label
    }()
    
    private let leadPositionStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .equalSpacing
        stackView.axis = .horizontal
        stackView.backgroundColor = UIColor(red: 223/255, green: 197/255, blue: 175/255, alpha: 1)
        return stackView
    }()
    
    private let globalStatisticsLabel: UILabel = {
        let label = UILabel()
        label.text = "Global statistics:"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        return label
    }()
    
    private let popularDrinkStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .equalSpacing
        stackView.axis = .horizontal
        stackView.backgroundColor = UIColor(red: 223/255, green: 197/255, blue: 175/255, alpha: 1)
        stackView.layer.cornerRadius = 20
        return stackView
    }()
    
    private let averageNumberStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .equalSpacing
        stackView.axis = .horizontal
        stackView.backgroundColor = UIColor(red: 223/255, green: 197/255, blue: 175/255, alpha: 1)
        stackView.layer.cornerRadius = 20
        return stackView
    }()
    
    private let recipesAppStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .equalSpacing
        stackView.axis = .horizontal
        stackView.backgroundColor = UIColor(red: 223/255, green: 197/255, blue: 175/255, alpha: 1)
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
        contentView.addSubview(userInfoStackView)
        contentView.addSubview(recommendationsLabel)
        contentView.addSubview(leadPositionStackView)
        contentView.addSubview(globalStatisticsLabel)
        contentView.addSubview(popularDrinkStackView)
        contentView.addSubview(averageNumberStackView)
        contentView.addSubview(recipesAppStackView)
        
        headerStackView.addArrangedSubview(logoTheBeanImageView)
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
            make.top.equalTo(headerStackView.snp.bottom).inset(35)
            make.left.equalTo(headerStackView.snp.right).inset(28)
        }
        
        userInfoStackView.snp.makeConstraints { make in
            make.height.equalTo(212)
            make.width.equalTo(315)
            make.top.equalTo(headerStackView.snp.bottom).inset(-9)
            make.centerX.equalTo(contentView)
        }
        
        recommendationsLabel.snp.makeConstraints { make in
            make.top.equalTo(userInfoStackView.snp.bottom).inset(-40)
            make.left.equalTo(30)
        }
        
        leadPositionStackView.snp.makeConstraints { make in
            make.top.equalTo(recommendationsLabel.snp.bottom).inset(-18)
            make.centerX.equalTo(contentView)
            make.width.equalTo(contentView)
            make.height.equalTo(140)
        }
        
        globalStatisticsLabel.snp.makeConstraints { make in
            make.top.equalTo(leadPositionStackView.snp.bottom).inset(-27)
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
