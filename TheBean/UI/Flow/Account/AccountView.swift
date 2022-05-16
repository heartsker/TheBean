//
//  AccountView.swift
//  TheBean
//
//  Created by Ilya Buldin on 16.05.2022.
//

import UIKit
import AssetsManager

final class AccountView: UIView, IBaseView {

    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(classCell: UserInfoHeadingCell.self)
        tableView.rowHeight = 200
        return tableView

    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        tableView.dataSource = self
        tableView.delegate = self
        setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    func setupAppearance() {
        backgroundColor = Pallete.background
    }

    func setupSubviews() {
        addSubview(tableView)
    }

    func setupConstraints() {
        tableView.frame = bounds
    }
}

extension AccountView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.create(cell: UserInfoHeadingCell.self, at: indexPath) else {
            return UITableViewCell()
        }
        let model = UserInfoHeadingCellModel(avatarName: "coffee.barista.hands", username: "Mr Vonu4ka", email: "vonu4ka001@gmail.com")
        cell.configure(model: model)
        return cell

    }

}

final class UserInfoHeadingCell: UITableViewCell {
    private lazy var avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
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
