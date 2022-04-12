//
//  ScoreView.swift
//  TheBean
//
//  Created by Илья Чуб on 11.04.2022.
//

import UIKit
import SnapKit

// MARK: ScoreView
class ScoreView: BaseCardView {

    // MARK: - Init
    init() {
        super.init(backgroundColor: .highlightPrimary, heightWidthRatio: 0.673)
        setup()
    }

    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Subviews
    private lazy var usernameLabel: UILabel = {
        let label = UILabel(text: Account.shared.username,
                            color: .black,
                            font: .bold(24))
        label.numberOfLines = 1
        return label
    }()

    private lazy var userimageView: UIImageView = {
        let imageview = UIImageView(image: Account.shared.userimage)
        imageview.layer.cornerRadius = UIScreen.main.bounds.width*0.144/2
        imageview.clipsToBounds = true
        return imageview
    }()

    private lazy var scoreLabel: UILabel = UILabel(text: ^StatsLocalization.scoreLabel,
                                                   color: .materialMedium,
                                                   font: .bold(18))
    private lazy var statsStackView = StatsStackView()
    private lazy var scoreView = ScoreLevelView()
}

// MARK: - Setup methods
extension ScoreView {
    private func setup() {
        setupSubviews()
        setupConstraints()
    }

    private func setupSubviews() {
        addSubview(usernameLabel)
        addSubview(userimageView)
        addSubview(scoreLabel)
        addSubview(statsStackView)
        addSubview(scoreView)
    }

    private func setupConstraints() {
        usernameLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(23)
            make.top.equalToSuperview().inset(20)
        }

        userimageView.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(40)
            make.top.equalToSuperview().inset(12)
            make.width.height.equalTo(UIScreen.main.bounds.width*0.144)
        }

        scoreLabel.snp.makeConstraints { make in
            make.top.equalTo(usernameLabel.snp.bottom).offset(20)
            make.leading.equalToSuperview().inset(23)
        }

        statsStackView.snp.makeConstraints { make in
            make.top.equalTo(scoreLabel.snp.bottom).offset(20)
            make.leading.equalToSuperview().inset(23)
            make.bottom.equalToSuperview().inset(UIScreen.main.bounds.width*0.1253)
            make.width.equalTo(UIScreen.main.bounds.width*0.3813)
        }

        scoreView.snp.makeConstraints { make in
            make.width.equalTo(UIScreen.main.bounds.width*0.2346)
            make.height.equalTo(scoreView.snp.width).multipliedBy(0.9204)
            make.trailing.equalToSuperview().inset(23)
            make.top.equalTo(userimageView.snp.bottom).offset(29)
        }
    }
}
