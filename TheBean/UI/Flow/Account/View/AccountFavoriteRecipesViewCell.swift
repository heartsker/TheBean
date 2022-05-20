//
//  AccountFavoriteRecipesView.swift
//  TheBean
//
//  Created by Ilya Buldin on 17.05.2022.
//

import UIKit
import Utils

final class AccountFavoriteRecipesViewCell: UITableViewCell {

    var recipes: [MockRecipeCard] = {
        var items: [MockRecipeCard] = CoffeeStrength.allCases.flatMap {
            MockRecipeCard.makeCards($0)
        }
        return items
    }()

    private lazy var collectionView: UICollectionView = {
        let collectionViewLayout = UICollectionViewFlowLayout()
        collectionViewLayout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
        collectionView.register(classCell: RecipeCell.self)

        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        contentView.clipsToBounds = true
        addSubview(collectionView)

    }

    override func layoutSubviews() {
        super.layoutSubviews()
        collectionView.frame = contentView.bounds
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

}

extension AccountFavoriteRecipesViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        recipes.count
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.create(cell: RecipeCell.self, at: indexPath) else {
            return UICollectionViewCell()
        }

        cell.configure(model: recipes[indexPath.row])
        return cell
    }

}

extension AccountFavoriteRecipesViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 140, height: 189)
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 18, left: 30, bottom: 0, right: 0)
    }

}
