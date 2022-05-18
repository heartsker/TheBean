//
//  AverageNumberCupsCard.swift
//  TheBean
//
//  Created by Ilya Chub on 22.03.2022.
//

import Localize
import AssetsManager

/// Card for average number of cups drunk
class AverageNumberCupsCard: BaseCardView {
    // MARK: - Properties
    private let value: Int
    private let cupImage: UIImage? = UIImage(named: "coffee.cup")
    private let suffix = StatsLocalization.averageCupsPerDay
    private lazy var text = "\(value) - \(suffix)"

    // MARK: - Initializers
    required init(value: Int) {
        self.value = value
        super.init(backgroundColor: Pallete.materialHeavy)
        setup()
    }

    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Subviews
    private lazy var label: UILabel = {
        CardLabel(text: text, isWhite: true)
    }()

    private lazy var secondBackground: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 20
        view.backgroundColor = Pallete.hightlightThirdly
        return view
    }()

    private lazy var cupsStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fillProportionally
        for _ in stride(from: 0, to: value, by: 1) {
            let imageView = UIImageView(image: ImageManager.cup)
            imageView.contentMode = .scaleAspectFit
            stack.addArrangedSubview(imageView)
        }
        return stack
    }()
}

// MARK: - Setup methods
extension AverageNumberCupsCard {
    private func setup() {
        setupSubviews()
        setupConstraints()
    }

    private func setupSubviews() {
        addSubview(secondBackground)
        addSubview(label)
        addSubview(cupsStackView)
    }

    private func setupConstraints() {
        secondBackground.snp.makeConstraints { make in
            make.height.equalToSuperview().multipliedBy(SecondBackground.heigthPercent)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }

        label.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(Label.padding)
            make.top.equalToSuperview().offset(Label.top)
        }

        cupsStackView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(CupsStack.padding)
            make.bottom.equalToSuperview().inset(UIScreen.main.bounds.width*0.015)
            make.height.equalTo(UIScreen.main.bounds.width*0.25)
        }
        layoutIfNeeded()
    }
}

// MARK: - Constraint constants
private extension AverageNumberCupsCard {
    enum SecondBackground {
        static let heigthPercent: CGFloat = 0.3906
    }
    enum Label {
        static let padding: CGFloat = 63
        static let top: CGFloat = 27
    }

    enum CupsStack {
        static let padding: CGFloat = 21
    }
}
