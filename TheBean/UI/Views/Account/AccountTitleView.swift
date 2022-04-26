//
//  AccountTitleView.swift
//  TheBean
//
//  Created by Daniel Pustotin on 25.03.2022.
//

import AssetsManager
import Account
import Reactive

class AccountTitleView: UIStackView {

    // MARK: - Initialization
    init() {
        super.init(frame: .zero)

        setup()
    }

    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Subviews
    private lazy var imageView: UIView = {
        let image = UIImageView(image: Account.shared.image ?? ImageManager.profilePicture)
        Publisher.subscribe(image, keyPath: \.image, for: .profileImagePost)
        image.tintColor = Pallete.highlightPrimary
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.layer.borderColor = UIColor.white.cgColor
        image.layer.borderWidth = 5
        return image
    }()

    private lazy var nameLabel: UIView = {
        let label = UILabel()
        label.text = Account.shared.username
        Publisher.subscribe(label, keyPath: \.text, for: .usernamePost)
        label.font = FontManager.bold(24)
        label.textColor = Pallete.materialHeavy
        label.textAlignment = .center
        return label
    }()

    private lazy var emailLabel: UIView = {
        let label = UILabel()
        label.text = Account.shared.email
        Publisher.subscribe(label, keyPath: \.text, for: .emailPost)
        label.font = FontManager.light(18)
        label.textColor = Pallete.materialMedium
        label.textAlignment = .center
        return label
    }()
}

// MARK: - Setup methods
extension AccountTitleView {
    private func setup() {
        setupAppearance()
        setupSubviews()
        setupConstraints()
    }

    private func setupAppearance() {
        axis = .vertical
        distribution = .fill
    }

    private func setupSubviews() {
        addSubview(imageView)
        addSubview(nameLabel)
        addSubview(emailLabel)
    }

    private func setupConstraints() {
        imageView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalTo(snp.height)
            // FIXME: (AS) - Needs to be replaced by inconstant radius with respect to superview
            imageView.layer.cornerRadius = 55
        }
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom)
            make.width.equalToSuperview()
            make.height.equalTo(50)
        }
        emailLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom)
            make.width.equalToSuperview()
            make.height.equalTo(50)
        }
    }
}
