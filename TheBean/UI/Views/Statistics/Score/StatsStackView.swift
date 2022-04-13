//
//  StatsStackView.swift
//  TheBean
//
//  Created by Илья Чуб on 11.04.2022.
//

import Foundation
import UIKit

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
        addArrangedSubview(RowStack(leftString: ^StatsLocalization.scoreCupsDrunk,
                                       rightString: "\(Account.shared.cupsDrunk)"))
        addArrangedSubview(RowStack(leftString: ^StatsLocalization.scoreRecipesMastered,
                                       rightString: "\(Account.shared.recipesMastered)"))
        addArrangedSubview(RowStack(leftString: ^StatsLocalization.scoreHealthScore,
                                       rightString: "\(Account.shared.healthScore)"))
    }
}
