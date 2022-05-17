//
//  UserInfoHeadingCell.swift
//  TheBean
//
//  Created by Ilya Buldin on 17.05.2022.
//

import UIKit
import AssetsManager

final class UserInfoHeadingCell: UITableViewCell {
    private lazy var avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill

        return imageView
    }()

    private lazy var userNameLabel: UILabel = {
       let label = UILabel()
        label.font = FontManager.bold(24)
        return label
    }()

    private lazy var emailLabel: UILabel = {
       let label = UILabel()
        label.font = FontManager.light(18)
        label.textColor = Pallete.materialMedium
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        [avatarImageView, userNameLabel, emailLabel].forEach {
            contentView.addSubview($0)
        }
        setupConstrainsts()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        makeImageViewRounded()
    }

    private func setupConstrainsts() {
        avatarImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(11)
            make.centerX.equalToSuperview()
            make.size.equalTo(110)
        }

        userNameLabel.snp.makeConstraints { make in
            make.centerX.equalTo(avatarImageView)
            make.top.equalTo(avatarImageView.snp.bottom).offset(18)
        }

        emailLabel.snp.makeConstraints { make in
            make.centerX.equalTo(userNameLabel)
            make.top.equalTo(userNameLabel.snp.bottom).offset(8)
        }
    }

    private func makeImageViewRounded() {
        avatarImageView.layer.cornerRadius = avatarImageView.frame.height / 2
        avatarImageView.clipsToBounds = true
    }
}

extension UserInfoHeadingCell: IConfigurationWithModel {
    typealias Model = UserInfoHeadingCellModel
    func configure(model: Model) {
        avatarImageView.image = ImageManager.baristaHands
        userNameLabel.text = model.username
        emailLabel.text = model.email
    }

}

struct UserInfoHeadingCellModel {
    let avatarName: String
    let username: String
    let email: String
}
