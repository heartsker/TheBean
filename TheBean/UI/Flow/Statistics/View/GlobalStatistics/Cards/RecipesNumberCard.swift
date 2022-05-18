//
//  RecipesNumberCard.swift
//  TheBean
//
//  Created by Ilya Chub on 07.04.2022.
//

import SnapKit
import Localize
import AssetsManager
import AdvancedGraphics

/// Recipes Number Card
class RecipesNumberCard: BaseCardView {

    // MARK: - Properties
    private let count: UInt
    private lazy var text = StatsLocalization.masteredRecipes(value: count)

    // MARK: - Initialization
    required init(count: UInt) {
        self.count = count
        super.init(backgroundColor: Pallete.highlightPrimary)
        setup()
    }

    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Subviews
    private lazy var imageViewLeft: UIImageView = {
        let imageView = UIImageView(image: ImageManager.coffeeBeans)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    private lazy var imageViewRight: UIImageView = {
        let imageView = UIImageView(image: ImageManager.coffeeReady)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    private lazy var arrowView = ArrowView()

    private lazy var label: UILabel = {
        CardLabel(text: text, isWhite: false)
    }()
}

// MARK: - Setup methods
extension RecipesNumberCard {
    private func setup() {
        setupSubviews()
        setupConstraints()
    }

    private func setupSubviews() {
        addSubview(imageViewLeft)
        addSubview(imageViewRight)
        addSubview(label)
        addSubview(arrowView)
    }

    private func setupConstraints() {
        label.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(Label.padding)
            make.top.equalToSuperview().inset(Label.top)
        }

        imageViewLeft.snp.makeConstraints { make in
            make.left.equalToSuperview()
            make.bottom.equalToSuperview().inset(ImageLeft.bottom)
            make.width.equalTo(.screenWidth*0.3333)
            make.height.equalTo(imageViewRight.snp.width).multipliedBy(ImageLeft.heightPercent)
        }

        imageViewRight.snp.makeConstraints { make in
            make.right.equalToSuperview()
            make.bottom.equalTo(imageViewLeft.snp.bottom)
            make.width.equalTo(imageViewLeft.snp.width)
            make.height.equalTo(imageViewLeft.snp.height)
        }

        arrowView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalTo(imageViewLeft.snp.centerY)
            make.height.equalTo(imageViewLeft.snp.height)
            make.width.equalToSuperview().multipliedBy(Arrow.widthPercent)
        }
    }
}

// MARK: - Constraint constants
private extension RecipesNumberCard {
    enum Label {
        static let padding: CGFloat = 63
        static let top: CGFloat = 28
    }

    enum ImageLeft {
        static let bottom: CGFloat = 10
        static let heightPercent: CGFloat = 0.944
    }

    enum Arrow {
        static let widthPercent: CGFloat = 0.1492
    }
}
