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

        tableView.register(RecipesTableHeaderView.self,
                           forHeaderFooterViewReuseIdentifier: RecipesTableHeaderView.reuseIdentifier)

        tableView.rowHeight = 210
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
    func numberOfSections(in tableView: UITableView) -> Int {
        3
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        if indexPath.section == 0 {
            guard let cell = tableView.create(cell: UserInfoHeadingCell.self, at: indexPath) else {
                return UITableViewCell()
            }
            let model = UserInfoHeadingCellModel(avatarName: "coffee.barista.hands", username: "Mr Vonu4ka", email: "vonu4ka001@gmail.com")
            cell.configure(model: model)
            return cell
        } else if indexPath.section == 1 {
            guard let cell = tableView.create(cell: AccountFavoriteRecipesView.self, at: indexPath) else {
                return UITableViewCell()
            }
            return cell
        }
        return UITableViewCell()

    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

        let id = RecipesTableHeaderView.reuseIdentifier
        guard let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: id)
                as? RecipesTableHeaderView else {
            return UITableViewHeaderFooterView()
        }
        headerView.configure(model: "Favorite recipes")
        if section == 1 {
            return headerView
        }
        return nil
    }

    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        nil
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 0
        } else if section == 1 {
            return 18
        } else {
            return 0
        }
    }

    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        0
    }

}
