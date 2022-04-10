//
//  RecipesViewController.swift
//  TheBean
//
//  Created by Daniel Pustotin on 31.01.2022.
//

import UIKit

final class RecipesViewController: UIViewController, IBaseView {
    // MARK: - Properties
    private lazy var collectionView: UICollectionView = {
        let collectionViewLayout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
        collectionView.backgroundColor = .systemPink
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
        return 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
}

extension RecipesViewController: UICollectionViewDelegate {

}
