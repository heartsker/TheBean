//
//  AccountView.swift
//  TheBean
//
//  Created by Ilya Buldin on 16.05.2022.
//

import UIKit
import AssetsManager
import Utils

final class AccountView: UIView, IBaseView {

    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(classCell: UserInfoHeadingCell.self)
        tableView.register(classCell: AccountFavoriteRecipesView.self)
        tableView.rowHeight = 200
        tableView.separatorColor = .clear
        tableView.allowsSelection = false
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
        2
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        if indexPath.row == 0 {
            guard let cell = tableView.create(cell: UserInfoHeadingCell.self, at: indexPath) else {
                return UITableViewCell()
            }
            let model = UserInfoHeadingCellModel(avatarName: "coffee.barista.hands", username: "Mr Vonu4ka", email: "vonu4ka001@gmail.com")
            cell.configure(model: model)
            return cell
        } else {
            guard let cell = tableView.create(cell: AccountFavoriteRecipesView.self, at: indexPath) else {
                return UITableViewCell()
            }
            return cell
        }
        return UITableViewCell()

    }

}
