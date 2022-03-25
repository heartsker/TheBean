//
//  TopRecomendationsView.swift
//  TheBean
//
//  Created by Илья Чуб on 15.03.2022.
//

import SnapKit
import UIKit

class TopRecomendationsView: UIStackView, BaseViewProtocol {
    // MARK: - Properties
    var recomendations: [(text: String, image: UIImage)]

    // MARK: - Initializations
    init(recomendations: [(String, UIImage)] ) {
        self.recomendations = recomendations
        super.init(frame: .zero)
        setup()
    }

    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Subviews
    private lazy var placesViews = {
        recomendations.map { (text: String, image: UIImage) in
            CoffeeBlockView(text: text, image: image)
        }
    }()

    // MARK: - Setup
    func setupAppearance() {
        axis = .horizontal
        distribution = .equalSpacing
    }

    func setupSubviews() {
        for stackView in placesViews {
            addArrangedSubview(stackView)
        }
    }

    func setupConstraints() {}
}
