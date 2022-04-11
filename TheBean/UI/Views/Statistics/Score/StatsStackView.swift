//
//  StatsStackView.swift
//  TheBean
//
//  Created by Илья Чуб on 11.04.2022.
//

import Foundation
import UIKit

// MARK: StatsView
class StatsStackView: UIStackView {

    // MARK: - Init
    init() {
        super.init(frame: .zero)
        setup()
    }

    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Setup methods
extension StatsStackView {
    private func setup() {
        setupAppearance()
        setupSubviews()
    }

    private func setupAppearance() {
        distribution = .equalSpacing
        axis = .vertical
    }

    private func setupSubviews() {
        addArrangedSubview(StringStack(leftString: ^StatsLocalization.scoreCupsDrunk,
                                       rightString: "\(Account.shared.cupsDrunk)"))
        addArrangedSubview(StringStack(leftString: ^StatsLocalization.scoreRecipesMastered,
                                       rightString: "\(Account.shared.recipesMastered)"))
        addArrangedSubview(StringStack(leftString: ^StatsLocalization.scoreHealthScore,
                                       rightString: "\(Account.shared.cupsDrunk)"))
    }
}

// MARK: - StringStack
private extension StatsStackView {
    private class StringStack: UIStackView {
        let leftString: String
        let rightString: String

        init(leftString: String, rightString: String) {
            self.leftString = leftString
            self.rightString = rightString
            super.init(frame: .zero)
            setup()
        }

        required init(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }

        private lazy var leftLabel = {
            UILabel(text: leftString,
                    color: .materialMedium,
                    font: .light(13))
        }()

        private lazy var rightLabel = {
            UILabel(text: rightString,
                    color: .materialMedium,
                    font: .light(13))
        }()

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
