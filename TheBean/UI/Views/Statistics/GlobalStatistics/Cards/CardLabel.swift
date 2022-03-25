//
//  CardsLabel.swift
//  TheBean
//
//  Created by Илья Чуб on 22.03.2022.
//

import Foundation
import UIKit

class CardLabel: UILabel, BaseViewProtocol {
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
        guard let text = super.text else {return}
        let color: UIColor = isWhite ? .white : .materialMedium
        let font: UIFont = isWhite ? .bold(16) : .medium(16)

        let string = NSMutableAttributedString(string: text)
        string.addAttribute(.foregroundColor,
                            value: color,
                            range: NSRange(text.startIndex ..< text.endIndex, in: text))

        string.addAttribute(.font,
                            value: font,
                            range: NSRange(text.startIndex ..< text.endIndex, in: text))

        let companyNameStartIndex = text.index(of: GeneralConstants.Text.companyName)
        let companyNameEndIndex = text.endIndex(of: GeneralConstants.Text.companyName)

        if companyNameStartIndex != nil && companyNameEndIndex != nil {
            string.addAttribute(.font,
                                value: UIFont.bold(16),
                                range: NSRange( companyNameStartIndex! ..< companyNameEndIndex!, in: text))
        }

        attributedText = string
        textAlignment = .center
        numberOfLines = 0
        lineBreakMode = .byClipping
    }
    func setupSubviews() {}
    func setupConstraints() {}
}
