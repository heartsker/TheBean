//
//  RecipesViewController.swift
//  TheBean
//
//  Created by Ilya Buldin on 11.04.2022.
//

import SwiftUI
import Localize
import Utils
import AssetsManager

final class RecipesViewController: UIViewController {

    // MARK: - Properties
    private lazy var store = MainStore.shared

    var recipes: [Int: [RecipeCard]] = {
        var items: [Int: [RecipeCard]] = [:]
        CoffeeStrength.allCases.forEach { items[$0.sectionProvider] = RecipeCard.makeCards($0) }
        return items
    }()

    private lazy var collectionView: UICollectionView = {
        let collectionViewLayout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
        collectionView.register(classCell: RecipeCell.self)
        collectionView.register(RecipesHeaderView.self,
                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                withReuseIdentifier: RecipesHeaderView.reuseIdentifier)
        collectionView.register(RecipesFooterView.self,
                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter,
                                withReuseIdentifier: RecipesFooterView.reuseIdentifier)
        return collectionView
    }()

    // MARK: - Initialization

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setupTabBar(^ControllerLocalization.recipes, image: "book")
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}

// MARK: - Setup
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
        view.backgroundColor = Pallete.background
        collectionView.backgroundColor = .clear
    }
}

// MARK: - Collection View DataSource
extension RecipesViewController: UICollectionViewDataSource {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return CoffeeStrength.allCases.count
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let cards = recipes[section] else {
            return 0
        }
        return cards.count
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.create(cell: RecipeCell.self, at: indexPath),
              let cards = recipes[indexPath.section] else {
            return UICollectionViewCell()
        }
        cell.configure(model: cards[indexPath.row])
        return cell
    }

    func collectionView(_ collectionView: UICollectionView,
                        viewForSupplementaryElementOfKind kind: String,
                        at indexPath: IndexPath) -> UICollectionReusableView {

        switch kind {
        case UICollectionView.elementKindSectionHeader:
            let headerKind = UICollectionView.elementKindSectionHeader
            let identifier = RecipesHeaderView.reuseIdentifier
            let cView = collectionView

            guard let headerView = cView.dequeueReusableSupplementaryView(ofKind: headerKind,
                                                                          withReuseIdentifier: identifier,
                                                                          for: indexPath) as? RecipesHeaderView else {
                return RecipesHeaderView()
            }

            headerView.configure(model: ^CoffeeStrength.allCases[indexPath.section].rawValue)
            return headerView
        default:
            let footerKind = UICollectionView.elementKindSectionFooter
            let identifier = RecipesFooterView.reuseIdentifier
            let cView = collectionView

            guard let footerView = cView.dequeueReusableSupplementaryView(ofKind: footerKind,
                                                                          withReuseIdentifier: identifier,
                                                                          for: indexPath) as? RecipesFooterView else {
                return RecipesFooterView()
            }
            footerView.delegate = self
            return footerView
        }
    }
}

// MARK: - Collection View Delegate
extension RecipesViewController: UICollectionViewDelegate { }

// MARK: - Flow Layout Delegate
extension RecipesViewController: UICollectionViewDelegateFlowLayout {

    enum LayoutConstants {
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
        return UIEdgeInsets(            top: LayoutConstants.topInset,
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

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: 250, height: 40)
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize(width: 100, height: 30)
    }
}

extension RecipesViewController: IRecipesFooterDelegate {
    func sectionFooterButtonTapped() {
        store.coordinator?.proceed(to: .recipes(.exampleRoute1))
    }
}
