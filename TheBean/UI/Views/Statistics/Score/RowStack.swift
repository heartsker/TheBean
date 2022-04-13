//
//  RowStack.swift
//  TheBean
//
//  Created by Илья Чуб on 12.04.2022.
//

import UIKit

// MARK: - RowStack
extension StatsStackView {
    class RowStack: UIStackView {
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
                    color: .materialMedium,
                    font: .light(13))
        }()

        private lazy var rightLabel = {
            UILabel(text: rightString,
                    color: .materialMedium,
                    font: .light(13))
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
