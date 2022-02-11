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
        stackView.backgroundColor = UIColor(red: 246/255, green: 246/255, blue: 246/255, alpha: 1)
        return stackView
    }()
    
    private let logoTheBeanImageView: UIImageView = {
        let imageView = UIImageView()
        let image = UIImage(named: "LogoTheBean")
        imageView.image = image
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
//        imageView.frame.size.width = 39
//        imageView.frame.size.height = 39
        return imageView
    }()
    
    private let userInfoStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .equalSpacing
        stackView.axis = .horizontal
        stackView.backgroundColor = UIColor(red: 223/255, green: 197/255, blue: 175/255, alpha: 1)
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAppearance()
        setupViews()
        setupConstraints()
    }
    
    private func setupViews() {
        view.backgroundColor = .white
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(headerStackView)
        headerStackView.addArrangedSubview(logoTheBeanImageView)
        contentView.addSubview(userInfoStackView)
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
//            make.width.equalTo(39)
//            make.height.equalTo(39)
            make.top.equalTo(headerStackView.snp.bottom).inset(35)
            make.left.equalTo(headerStackView.snp.right).inset(28)
        }
        
        userInfoStackView.snp.makeConstraints { make in
            make.height.equalTo(212)
            make.width.equalTo(315)
            make.top.equalTo(headerStackView.snp.bottom).inset(9)
            make.centerX.equalTo(contentView)
        }
    }
    
}
