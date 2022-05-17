//
//  AccountFavoriteRecipesView.swift
//  TheBean
//
//  Created by Ilya Buldin on 17.05.2022.
//

import UIKit
import Utils

final class AccountFavoriteRecipesView: UITableViewCell {

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
//        collectionView.register(RecipesHeaderView.self,
//                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
//                                withReuseIdentifier: RecipesHeaderView.reuseIdentifier)

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

extension AccountFavoriteRecipesView: UICollectionViewDelegate, UICollectionViewDataSource {
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

//    func collectionView(_ collectionView: UICollectionView,
//                        viewForSupplementaryElementOfKind kind: String,
//                        at indexPath: IndexPath) -> UICollectionReusableView {
//
//            let headerKind = UICollectionView.elementKindSectionHeader
//            let identifier = RecipesHeaderView.reuseIdentifier
//            let cView = collectionView
//
//            guard let headerView = cView.dequeueReusableSupplementaryView(ofKind: headerKind,
//                                                                          withReuseIdentifier: identifier,
//                                                                          for: indexPath) as? RecipesHeaderView else {
//                return RecipesHeaderView()
//            }
//
//            headerView.configure(model: "Favorite recipes")
//            return headerView
//
//    }
}

extension AccountFavoriteRecipesView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 140, height: 189)
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 36, left: 30, bottom: 0, right: 0)
    }

}
