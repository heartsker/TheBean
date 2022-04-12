//
//  RecipesViewController.swift
//  TheBean
//
//  Created by Daniel Pustotin on 31.01.2022.
//

import UIKit

final class RecipesViewController: UIViewController {
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
        collectionView.register(classCell: RecipeCell.self)
        return collectionView
    }()

    // MARK: - Methods

    // MARK: - Initialization
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}

extension RecipesViewController: IBaseView {

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
    }

    func setupAppearance() {
        view.backgroundColor = .background
        collectionView.backgroundColor = .clear
    }
}

extension RecipesViewController: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return recipes.count
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

extension RecipesViewController: UICollectionViewDelegate { }

extension RecipesViewController: UICollectionViewDelegateFlowLayout {

    private enum LayoutConstants {
        static let screenHeight: CGFloat = UIScreen.main.bounds.height
        static let screenWidth: CGFloat = UIScreen.main.bounds.width
        static let leftRightInset: CGFloat = screenWidth * 31/375
        static let topInset: CGFloat = 18
        static let bottomInset: CGFloat = 28
        static let betweenSpacing: CGFloat = 13
        // cellHeight calculates as cellWidth*multiplier inside collectionView( ... ) -> CGSize
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = itemWidth(for: LayoutConstants.screenWidth, spacing: LayoutConstants.betweenSpacing)
        let cellHeight: CGFloat = width * 201/151
        return CGSize(width: width, height: cellHeight)
    }

    func itemWidth(for width: CGFloat, spacing: CGFloat) -> CGFloat {
        let itemsInRow: CGFloat = 2
        let totalSpacing: CGFloat = (itemsInRow - 1) * spacing + 2 * LayoutConstants.leftRightInset
        let finalWidth = (width - totalSpacing) / itemsInRow
        return finalWidth
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: LayoutConstants.topInset,
                            left: LayoutConstants.leftRightInset,
                            bottom: LayoutConstants.bottomInset,
                            right: LayoutConstants.leftRightInset)
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
}
