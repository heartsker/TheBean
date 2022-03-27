//
//  CardsLabel.swift
//  TheBean
//
//  Created by Илья Чуб on 22.03.2022.
//

import UIKit

// TODO: (IC) Add comments
class CardLabel: UILabel, IBaseView {
    let isWhite: Bool

    init(text: String, isWhite: Bool) {
        self.isWhite = isWhite
        super.init(frame: .zero)
        super.text = text
        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setup() {
        setupAppearance()
        setupSubviews()
        setupConstraints()
    }

    func setupAppearance() {
        guard let text = super.text else {
            return
        }

        let color: UIColor = isWhite ? .white : .materialMedium
        let font: UIFont = isWhite ? .bold(16) : .medium(16)

        let string = NSMutableAttributedString(string: text)
        string.addAttribute(.foregroundColor,
                            value: color,
                            range: NSRange(text.startIndex ..< text.endIndex, in: text))

        string.addAttribute(.font,
                            value: font,
                            range: NSRange(text.startIndex ..< text.endIndex, in: text))

        attributedText = string
        textAlignment = .center
        numberOfLines = 0
        lineBreakMode = .byClipping
    }

    func setupSubviews() {}

    func setupConstraints() {}
}
