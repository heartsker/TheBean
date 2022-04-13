//
//  ScoreLevelView.swift
//  TheBean
//
//  Created by Илья Чуб on 12.04.2022.
//

import UIKit

// MARK: - ScoreLevelView
extension ScoreView {
    class ScoreLevelView: UIView {

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
                    font: .regular(36))
        }()

        // MARK: - Setup methods
        private func setup() {
            setupAppearence()
            setupSubviews()
            setupConstraints()
        }

        private func setupAppearence() {
            backgroundColor = .highlightPrimary
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
            UIColor.accentColor.setStroke()
            path.stroke()
        }
    }
}
