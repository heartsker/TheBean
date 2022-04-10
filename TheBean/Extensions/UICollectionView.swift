//
//  UICollectionView.swift
//  TheBean
//
//  Created by Ilya Buldin on 11.04.2022.
//

import UIKit

protocol ReuseIdentifyingCellProtocol: UIView {
    static var reuseIdentifier: String { get }
}

extension ReuseIdentifyingCellProtocol {
    static var reuseIdentifier: String {
        return String(describing: Self.self)
    }
}

extension UICollectionViewCell: ReuseIdentifyingCellProtocol {}

extension UICollectionView {

    func create<A: ReuseIdentifyingCellProtocol>(cell: A.Type, at index: IndexPath) -> A {
        // swiftlint:disable force_cast
        return self.dequeueReusableCell(withReuseIdentifier: cell.reuseIdentifier, for: index) as! A
        // swiftlint:enable force_cast
    }

    func register<A: ReuseIdentifyingCellProtocol>(classXIB: A.Type) {
        let cell = UINib(nibName: classXIB.reuseIdentifier, bundle: nil)
        self.register(cell, forCellWithReuseIdentifier: classXIB.reuseIdentifier)
    }

    func register<A: ReuseIdentifyingCellProtocol>(classCell: A.Type) {
        self.register(classCell.self, forCellWithReuseIdentifier: classCell.reuseIdentifier)
    }
}
