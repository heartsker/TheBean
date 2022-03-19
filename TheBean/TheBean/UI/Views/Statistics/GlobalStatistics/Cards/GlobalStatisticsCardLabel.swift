//
//  GlobalStatisticsCardLabel.swift
//  TheBean
//
//  Created by Илья Чуб on 17.03.2022.
//

import UIKit

class GlobalStatisticsCardLabel: UILabel, BaseViewProtocol {
    // MARK: Properties
    let labelText: String
    let isTextStyleDark: Bool

    // MARK: - Initialization
    init(labelText: String, isTextStyleDark: Bool) {
        self.labelText = labelText
        self.isTextStyleDark = isTextStyleDark
        super.init(frame: .zero)

        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Methods
    // TODO: (IC) Check if we can avoid attributed strings
    private func getAttributedString() -> NSAttributedString {
        let attributedString = NSMutableAttributedString(string: self.labelText)
        attributedString.addAttribute(.font,
                                      value: UIFont(name: "Muller-Trial-Medium",
                                                    size: 16) ?? .systemFont(ofSize: 16),
                                      range: NSRange(self.labelText.startIndex ..< self.labelText.endIndex,
                                                     in: self.labelText))
        attributedString.addAttribute(.foregroundColor,
                                      value: self.isTextStyleDark ? UIColor.materialMedium : .white,
                                      range: NSRange(self.labelText.startIndex ..< self.labelText.endIndex,
                                                      in: self.labelText))
        return attributedString
    }

    // MARK: - Setup
    func setupAppearance() {
        self.textAlignment = .center
        self.numberOfLines = 0
        self.lineBreakMode = .byClipping
        self.attributedText = self.getAttributedString()
    }

    func setupSubviews() {
    }

    func setupConstraints() {
    }
}
