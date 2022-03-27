//
//  AppFonts.swift
//  TheBean
//
//  Created by Alina on 12.02.2022.
//

import UIKit

extension UIFont {
    // swiftlint:disable colon
    static let light:   UIFont = .init(name: "Muller-Trial-Light", size: 14)!
    static let regular: UIFont = .init(name: "Muller-Trial-Regular", size: 14)!
    static let medium:  UIFont = .init(name: "Muller-Trial-Medium", size: 14)!
    static let bold:    UIFont = .init(name: "Muller-Trial-Bold", size: 14)!
    // swiftlint:enable colon

    static func light(_ size: CGFloat = 14) -> UIFont {
        .light.withSize(size)
    }

    static func regular(_ size: CGFloat = 14) -> UIFont {
        .regular.withSize(size)
    }

    static func medium(_ size: CGFloat = 14) -> UIFont {
        .medium.withSize(size)
    }

    static func bold(_ size: CGFloat = 14) -> UIFont {
        .bold.withSize(size)
    }
}
