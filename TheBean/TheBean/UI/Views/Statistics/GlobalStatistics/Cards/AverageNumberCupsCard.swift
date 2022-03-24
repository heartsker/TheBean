//
//  AverageNumberCupsCard.swift
//  TheBean
//
//  Created by Илья Чуб on 22.03.2022.
//

import UIKit

class AverageNumberCupsCard: UIStackView, CardRepresentable {
    // MARK: - Properties
    let cupImage: UIImage?
    let numberOfCups: Int
    let text: String
    let cornerRadius: CGFloat = 20

    lazy var card: UIView = {
        self
    }()

    // MARK: - Initialization
    required init(text: String, numberOfCups: Int) {
        self.text = text
        self.numberOfCups = numberOfCups
        cupImage = UIImage(named: "Cup")
        super.init(frame: .zero)
        setup()
    }

    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private lazy var label: UILabel = {
        CardLabel(text: text, isWhite: true)
    }()

    private lazy var secondBackground: UIView = {
        let view = UIView()
        view.layer.cornerRadius = cornerRadius
        view.backgroundColor = .hightlightThirdly
        return view
    }()
    
    private lazy var cupsStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .equalSpacing
        for i in stride(from: 0, to: numberOfCups, by: 1) {
            
        }
        return stack
    }()

    // MARK: - Setup
    func setupAppearance() {
        backgroundColor = .materialHeavy
        layer.cornerRadius = cornerRadius
    }

    func setupSubviews() {
        addSubview(secondBackground)
        addSubview(label)
    }

    func setupConstraints() {
        snp.makeConstraints { make in
            make.height.equalTo(snp.width).multipliedBy(0.6095)
        }

        secondBackground.snp.makeConstraints { make in
            make.height.equalToSuperview().multipliedBy(0.3906)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }

        label.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(64)
            make.top.equalToSuperview().inset(28)
        }

    }
}
