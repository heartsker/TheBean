//
//  StatisticsViewController.swift
//  TheBean
//
//  Created by Alina on 10.02.2022.
//

import UIKit
import SnapKit

class StatisticsViewController: TheBeanVC {
    
    private let scrollView = UIScrollView()
    private let contentView = UIView()

    private let stackView: UIStackView = {
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
        contentView.addSubview(stackView)
        stackView.addArrangedSubview(logoTheBeanImageView)
    }
    
    override func setupConstraints() {
        scrollView.snp.makeConstraints { (make) in
            make.edges.equalTo(view)
        }
        
        contentView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalTo(self.scrollView)
        }
        
        stackView.snp.makeConstraints { make in
            make.top.equalTo(contentView)
            make.width.equalTo(contentView)
            make.height.equalTo(95)
        }
        
        logoTheBeanImageView.snp.makeConstraints { make in
//            make.width.equalTo(39)
//            make.height.equalTo(39)
            make.top.equalTo(stackView.snp.bottom).inset(35)
            make.left.equalTo(stackView.snp.right).inset(28)
        }
    }
    
}
