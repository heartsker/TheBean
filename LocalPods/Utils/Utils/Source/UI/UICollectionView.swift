//
//  UICollectionView.swift
//  Utils
//
//  Created by Ilya Buldin on 11.04.2022.
//

/// Provides all UIView's reuseIdentifier to simplify working with tableView or collectionView
public protocol IReuseIdentifying: UIView {
    static var reuseIdentifier: String { get }
}

public extension IReuseIdentifying {

    static var reuseIdentifier: String {
        return String(describing: Self.self)
    }
}

extension UICollectionViewCell: IReuseIdentifying {}

public extension UICollectionView {

    func create<A: IReuseIdentifying>(cell: A.Type, at index: IndexPath) -> A? {
        return self.dequeueReusableCell(withReuseIdentifier: cell.reuseIdentifier, for: index) as? A
    }

    func register<A: IReuseIdentifying>(classXIB: A.Type) {
        let cell = UINib(nibName: classXIB.reuseIdentifier, bundle: nil)
        self.register(cell, forCellWithReuseIdentifier: classXIB.reuseIdentifier)
    }

    func register<A: IReuseIdentifying>(classCell: A.Type) {
        self.register(classCell.self, forCellWithReuseIdentifier: classCell.reuseIdentifier)
    }
}
