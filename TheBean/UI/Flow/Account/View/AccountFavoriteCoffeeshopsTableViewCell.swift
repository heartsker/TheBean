//
//  AccountFavoriteCoffeshopsView.swift
//  TheBean
//
//  Created by Ilya Buldin on 20.05.2022.
//

import UIKit

final class AccountFavoriteCoffeeshopsTableViewCell: UITableViewCell {

    let favorites = ["Coffe like", "Skuratov", "Surf coffee", "Red cup", "Starbucks"]
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = .init(top: 0, left: 30, bottom: 0, right: 30)
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(classCell: FavoriteCoffeeShopCollectionViewCell.self)
        return collectionView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        contentView.clipsToBounds = true
        contentView.addSubview(collectionView)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        collectionView.frame = contentView.bounds
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

}

extension AccountFavoriteCoffeeshopsTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        favorites.count
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.create(cell: FavoriteCoffeeShopCollectionViewCell.self, at: indexPath) else {
            return UICollectionViewCell()
        }

        cell.configure(model: favorites[indexPath.row])
        return cell
    }
}
