////
////  HeadingStackView.swift
////  TheBean
////
////  Created by Daniel Pustotin on 13.03.2022.
////
//
//import Foundation
//import UIKit
//
//class HeadingStaskView: UIStackView {
//    
//    // MARK: - Initialization
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        
//        distribution = .equalSpacing
//        axis = .horizontal
//        
//        setupSubiews()
//        setupConstraints()
//    }
//    
//    required init(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    // MARK: - Subviews
//    
//    // MARK: Username
//    lazy private var usernameLabel: UILabel = {
//        UILabel(text: account.username, color: .materialHeavy, font: UIFont.systemFont(ofSize: 24, weight: .bold))
//    }()
//
//    // MARK: Picture
//    lazy private var pictureImageView: UIImageView = {
//        let picture = UIImageView(image: account.picture)
//        picture.clipsToBounds = true
//        picture.contentMode = .scaleAspectFit
//        return picture
//    }()
//    
//    // MARK: - Setup subviews
//    private func setupSubiews() {
//        addSubview(usernameLabel)
//        addSubview(pictureImageView)
//    }
//    
//    private func setupConstraints() {
//        usernameLabel.snp.makeConstraints { make in
//            make.top.equalTo(20)
//            make.left.equalTo(23)
//        }
//        
//        pictureImageView.snp.makeConstraints { make in
//            make.width.equalTo(54)
//            make.height.equalTo(54)
//            make.top.equalTo(12)
//            make.right.equalTo(-40)
//        }
//    }
//}
