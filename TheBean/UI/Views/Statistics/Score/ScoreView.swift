//
//  ScoreView.swift
//  TheBean
//
//  Created by Илья Чуб on 11.04.2022.
//

import UIKit
import SnapKit
import Localize
import Utils
import AssetsManager

class ScoreView: BaseCardView {

    // MARK: - Init
    init() {
        super.init(backgroundColor: Pallete.highlightPrimary, heightWidthRatio: 0.673)
        setup()
    }

    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Subviews
    private lazy var usernameLabel: UILabel = {
        let label = UILabel(text: Account.shared.username,
                            color: .black,
                            font: FontManager.bold(24))
        label.numberOfLines = 1
        return label
    }()

    private lazy var userimageView: UIImageView = {
        let imageview = UIImageView(image: Account.shared.image)
        imageview.layer.cornerRadius = .screenWidth * 0.144 / 2
        imageview.clipsToBounds = true
        return imageview
    }()

    private lazy var scoreLabel: UILabel = UILabel(text: ^StatsLocalization.scoreLabel,
                                                   color: Pallete.materialMedium,
                                                   font: FontManager.bold(18))
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
            make.width.height.equalTo(.screenWidth*0.144)
        }

        scoreLabel.snp.makeConstraints { make in
            make.top.equalTo(usernameLabel.snp.bottom).offset(20)
            make.leading.equalToSuperview().inset(23)
        }

        statsStackView.snp.makeConstraints { make in
            make.top.equalTo(scoreLabel.snp.bottom).offset(20)
            make.leading.equalToSuperview().inset(23)
            make.bottom.equalToSuperview().inset(.screenWidth*0.1253)
            make.width.equalTo(.screenWidth*0.3813)
        }

        scoreView.snp.makeConstraints { make in
            make.width.equalTo(.screenWidth*0.2346)
            make.height.equalTo(scoreView.snp.width).multipliedBy(0.9204)
            make.trailing.equalToSuperview().inset(23)
            make.top.equalTo(userimageView.snp.bottom).offset(29)
        }
    }
}

// MARK: - StatsStackView
extension ScoreView {

    private class StatsStackView: UIStackView {

        // MARK: - Init
        init() {
            super.init(frame: .zero)
            setup()
        }

        required init(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }

        // MARK: - Setup methods
        private func setup() {
            setupAppearance()
            setupSubviews()
        }

        private func setupAppearance() {
            distribution = .equalSpacing
            axis = .vertical
        }

        private func setupSubviews() {
            addArrangedSubview(RowStack(leftString: ^StatsLocalization.scoreCupsDrunk,
                                           rightString: "\(Account.shared.cupsCount)"))
            addArrangedSubview(RowStack(leftString: ^StatsLocalization.scoreRecipesMastered,
                                           rightString: "\(Account.shared.recipesCount)"))
            addArrangedSubview(RowStack(leftString: ^StatsLocalization.scoreHealthScore,
                                           rightString: "\(Account.shared.healthScore)"))
        }
    }
}

// MARK: - RowStack
extension ScoreView {

    private class RowStack: UIStackView {
        let leftString: String
        let rightString: String

        // MARK: - Init
        init(leftString: String, rightString: String) {
            self.leftString = leftString
            self.rightString = rightString
            super.init(frame: .zero)
            setup()
        }

        required init(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }

        // MARK: - Subviews
        private lazy var leftLabel = {
            UILabel(text: leftString,
                    color: Pallete.materialMedium,
                    font: FontManager.light(13))
        }()

        private lazy var rightLabel = {
            UILabel(text: rightString,
                    color: Pallete.materialMedium,
                    font: FontManager.light(13))
        }()

        // MARK: - Setup methods
        private func setup() {
            setupAppearance()
            setupSubviews()
        }

        private func setupAppearance() {
            axis = .horizontal
            distribution = .equalSpacing
        }

        private func setupSubviews() {
            addArrangedSubview(leftLabel)
            addArrangedSubview(rightLabel)
        }
    }

}

// MARK: - ScoreLevelView
extension ScoreView {
    private class ScoreLevelView: UIView {

        // MARK: - Init
        init() {
            super.init(frame: .zero)
            setup()
        }

        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }

        // MARK: - Subviews
        private lazy var label: UILabel = {
            UILabel(text: "\(Account.shared.level)",
                    color: .black,
                    font: FontManager.regular(36))
        }()

        // MARK: - Setup methods
        private func setup() {
            setupAppearence()
            setupSubviews()
            setupConstraints()
        }

        private func setupAppearence() {
            backgroundColor = Pallete.highlightPrimary
        }

        private func setupSubviews() {
            addSubview(label)
        }

        private func setupConstraints() {
            label.snp.makeConstraints { make in
                make.centerX.centerY.equalToSuperview()
            }
        }

        override func draw(_ rect: CGRect) {
            let path = UIBezierPath(ovalIn: CGRect(x: 2.5,
                                                   y: 2.5,
                                                   width: rect.width-5,
                                                   height: rect.height-5))
            path.lineWidth = 5
            Pallete.accentColor.setStroke()
            path.stroke()
        }
    }
}
