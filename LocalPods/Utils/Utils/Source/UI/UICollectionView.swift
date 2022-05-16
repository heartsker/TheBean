//
//  UICollectionView.swift
//  Utils
//
//  Created by Ilya Buldin on 11.04.2022.
//

// swiftlint:disable missing_docs
// TODO: (IB) - Add missing docs

/// Provides all UIView's reuseIdentifier to simplify working with tableView or collectionView
public protocol IReuseIdentifiable: UIView {
    static var reuseIdentifier: String { get }
}

/// Extends IReuseIdentifiable with default implementation of reuseIdentifier computed property
public extension IReuseIdentifiable {
    static var reuseIdentifier: String {
        String(describing: Self.self)
    }
}

extension UICollectionViewCell: IReuseIdentifiable {}

/// Extends UICollectionViewCell with functionality which simplifies with dequeueReusableCell method
public extension UICollectionView {
    func create<A: IReuseIdentifiable>(cell: A.Type, at index: IndexPath) -> A? {
        self.dequeueReusableCell(withReuseIdentifier: cell.reuseIdentifier, for: index) as? A
    }

    func register<A: IReuseIdentifiable>(classXIB: A.Type) {
        let cell = UINib(nibName: classXIB.reuseIdentifier, bundle: nil)
        self.register(cell, forCellWithReuseIdentifier: classXIB.reuseIdentifier)
    }

    func register<A: IReuseIdentifiable>(classCell: A.Type) {
        self.register(classCell.self, forCellWithReuseIdentifier: classCell.reuseIdentifier)
    }
}

extension UITableViewCell: IReuseIdentifiable {}

public extension UITableView {
    func register<A: IReuseIdentifiable>(classCell: A.Type) {
        self.register(classCell.self, forCellReuseIdentifier: classCell.reuseIdentifier)
    }

    func register<A: IReuseIdentifiable>(classXIB: A.Type) {
        let cell = UINib(nibName: classXIB.reuseIdentifier, bundle: nil)
        self.register(cell, forCellReuseIdentifier: classXIB.reuseIdentifier)
    }

    func create<A: IReuseIdentifiable>(cell: A.Type, at index: IndexPath) -> A? {
        self.dequeueReusableCell(withIdentifier: cell.reuseIdentifier, for: index) as? A
    }
}
