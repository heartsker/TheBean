//
//  UICollectionView.swift
//  Utils
//
//  Created by Ilya Buldin on 11.04.2022.
//

/// Provides all UIView's reuseIdentifier to simplify working with tableView or collectionView
public protocol IReuseIdentifiable: UIView {
    static var reuseIdentifier: String { get }
}

/// Extends IReuseIdentifiable with default implementation of reuseIdentifier computing var
public extension IReuseIdentifiable {

    static var reuseIdentifier: String {
        return String(describing: Self.self)
    }
}

extension UICollectionViewCell: IReuseIdentifiable {}

/// Extents UICollectionViewCell with functionality which simplifies with dequeueReusableCell method
public extension UICollectionView {

    func create<A: IReuseIdentifiable>(cell: A.Type, at index: IndexPath) -> A? {
        return self.dequeueReusableCell(withReuseIdentifier: cell.reuseIdentifier, for: index) as? A
    }

    func register<A: IReuseIdentifiable>(classXIB: A.Type) {
        let cell = UINib(nibName: classXIB.reuseIdentifier, bundle: nil)
        self.register(cell, forCellWithReuseIdentifier: classXIB.reuseIdentifier)
    }

    func register<A: IReuseIdentifiable>(classCell: A.Type) {
        self.register(classCell.self, forCellWithReuseIdentifier: classCell.reuseIdentifier)
    }
}
