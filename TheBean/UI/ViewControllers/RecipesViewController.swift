//
//  RecipesViewController.swift
//  TheBean
//
//  Created by Daniel Pustotin on 31.01.2022.
//

import UIKit

final class RecipesViewController: UIViewController, IBaseView {
    // MARK: - Properties
    var recipes: [RecipeCardModel] = [
        .init(title: "Latte", drinkKind: .latte, volume: 300, cookingTime: 10),
        .init(title: "Flat White", drinkKind: .flatwhite, volume: 250, cookingTime: 11),
        .init(title: "Americano", drinkKind: .americano, volume: 300, cookingTime: 13),
        .init(title: "Latte", drinkKind: .latte, volume: 300, cookingTime: 10),
        .init(title: "Flat White", drinkKind: .flatwhite, volume: 250, cookingTime: 11),
        .init(title: "Americano", drinkKind: .americano, volume: 300, cookingTime: 13),
        .init(title: "Latte", drinkKind: .latte, volume: 300, cookingTime: 10),
        .init(title: "Flat White", drinkKind: .flatwhite, volume: 250, cookingTime: 11),
        .init(title: "Americano", drinkKind: .americano, volume: 300, cookingTime: 13),
        .init(title: "Latte", drinkKind: .latte, volume: 300, cookingTime: 10),
        .init(title: "Flat White", drinkKind: .flatwhite, volume: 250, cookingTime: 11),
        .init(title: "Americano", drinkKind: .americano, volume: 300, cookingTime: 13),
        .init(title: "Latte", drinkKind: .latte, volume: 300, cookingTime: 10),
        .init(title: "Flat White", drinkKind: .flatwhite, volume: 250, cookingTime: 11),
        .init(title: "Americano", drinkKind: .americano, volume: 300, cookingTime: 13)
    ]

    private lazy var collectionView: UICollectionView = {
        let collectionViewLayout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
        collectionView.backgroundColor = .systemPink
        collectionView.register(classCell: RecipeCell.self)
        return collectionView
    }()

    // MARK: - Methods

    // MARK: - Initialization
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }

    // MARK: - Setup
    func setupConstraints() {
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.bottom.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
    }

    func setupSubviews() {
        view.addSubview(collectionView)

        collectionView.delegate = self
        collectionView.dataSource = self
    }
}

extension RecipesViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return recipes.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.create(cell: RecipeCell.self, at: indexPath) else {
            return UICollectionViewCell()
        }
        cell.configure(model: recipes[indexPath.row])
        return cell
    }
}

extension RecipesViewController: UICollectionViewDelegate {

}

extension RecipesViewController: UICollectionViewDelegateFlowLayout {
    private enum LayoutConstant {
        static let spacing: CGFloat = 16.0
        static let itemHeight: CGFloat = 300.0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let width = itemWidth(for: view.frame.width, spacing: 0)

        return CGSize(width: width, height: LayoutConstant.itemHeight)
    }

    func itemWidth(for width: CGFloat, spacing: CGFloat) -> CGFloat {
        let itemsInRow: CGFloat = 2

        let totalSpacing: CGFloat = 2 * spacing + (itemsInRow - 1) * spacing
        let finalWidth = (width - totalSpacing) / itemsInRow

        return finalWidth - 5.0
    }
}
