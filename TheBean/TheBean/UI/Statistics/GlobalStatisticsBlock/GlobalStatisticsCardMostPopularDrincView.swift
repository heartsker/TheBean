//
//  GlobalStatisticsCardMostPopularDrincView.swift
//  TheBean
//
//  Created by Илья Чуб on 16.03.2022.
//

import Foundation
import UIKit


class GlobalStatisticsCardMostPopularDrincView: UIStackView, GlobalStatisticsCardProtocol {
    
//    let data: String
    let image = UIImage(named: "BaristaHands")
    let text: String
    
    
    required init(text: String){
        self.text = text
        super.init(frame: .zero)
        settings()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView(image: self.image)
        imageView.layer.cornerRadius = 20
        return imageView
    }()
    
    private lazy var label: GlobalStatisticsCardLabel = {
        GlobalStatisticsCardLabel(labelText: text, isTextStyleDark: true)
    }()
    
    private func settings() {
        setupSelf()
        setupSubviews()
        setupConstraints()
    }
    
    private func setupSelf() {
        self.backgroundColor = .highlightPrimary
        self.layer.cornerRadius = 20
    }
    
    private func setupSubviews() {
        self.addSubview(imageView)
        self.addSubview(label)
    }
    
    private func setupConstraints() {
        self.snp.makeConstraints { make in
            make.height.equalTo(192)
        }
        
        imageView.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(18)
            make.centerY.equalToSuperview()
            make.height.equalTo(165)
            make.width.equalTo(110)
        }
        
        label.snp.makeConstraints { make in
            make.left.equalTo(imageView.snp.right).offset(14)
            make.right.equalToSuperview().inset(18)
            make.centerY.equalToSuperview()
        }
    }

    
    func getGlobalStatisticsCard() -> UIStackView {
        return self
    }
}
