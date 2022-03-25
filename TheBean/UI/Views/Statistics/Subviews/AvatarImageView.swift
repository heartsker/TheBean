//
//  AvatarImageView.swift
//  TheBean
//
//  Created by Илья Чуб on 15.03.2022.
//

import UIKit

class AvatarImageView: UIImageView, BaseViewProtocol {
    // MARK: - Properties
    var avatarImage: UIImage

    // MARK: - Initialization
    init(avatarImage: UIImage) {
        self.avatarImage = avatarImage
        super.init(frame: .zero)
        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setup()
    func setupAppearance() {
        self.image = self.avatarImage
        self.clipsToBounds = true
        self.contentMode = .scaleAspectFit
    }

    func setupSubviews() {
    }

    func setupConstraints() {
    }
}
