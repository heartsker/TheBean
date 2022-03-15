//
//  AccountStatisticsCardView.swift
//  TheBean
//
//  Created by Daniel Pustotin on 13.03.2022.
//

import UIKit

class AccountStatisticsCardView: UIView {
    var account: Account
    
    init(_ account: Account, frame: CGRect) {
        self.account = account
        super.init(frame: frame)
        
        addSubview(cardStackView)
    }
    
    @available(*, unavailable)
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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
        HeadingStaskView()
    }()
    
    // MARK: - Body
    lazy private var bodyStackView: UIStackView = {
        BodyStackView()
    }()
}
