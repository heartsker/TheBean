//
//  UICollectionView.swift
//  Utils
//
//  Created by Ilya Buldin on 11.04.2022.
//

public protocol ReuseIdentifyingProtocol: UIView {
    static var reuseIdentifier: String { get }
}

public extension ReuseIdentifyingProtocol {
    static var reuseIdentifier: String {
        return String(describing: Self.self)
    }
}

extension UICollectionViewCell: ReuseIdentifyingProtocol {}

public extension UICollectionView {

    func create<A: ReuseIdentifyingProtocol>(cell: A.Type, at index: IndexPath) -> A? {
        return self.dequeueReusableCell(withReuseIdentifier: cell.reuseIdentifier, for: index) as? A
    }

    func register<A: ReuseIdentifyingProtocol>(classXIB: A.Type) {
        let cell = UINib(nibName: classXIB.reuseIdentifier, bundle: nil)
        self.register(cell, forCellWithReuseIdentifier: classXIB.reuseIdentifier)
    }

    func register<A: ReuseIdentifyingProtocol>(classCell: A.Type) {
        self.register(classCell.self, forCellWithReuseIdentifier: classCell.reuseIdentifier)
    }
}
