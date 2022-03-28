//
//  AppFonts.swift
//  TheBean
//
//  Created by Alina on 12.02.2022.
//

import UIKit

extension UIFont {
    static func light(_ size: CGFloat = 14) -> UIFont {
        .init(name: "MullerLight", size: size) ?? .systemFont(ofSize: size)
    }

    static func regular(_ size: CGFloat = 14) -> UIFont {
        .init(name: "MullerRegular", size: size) ?? .systemFont(ofSize: size)
    }

    static func medium(_ size: CGFloat = 14) -> UIFont {
        .init(name: "MullerMedium", size: size) ?? .systemFont(ofSize: size)
    }

    static func bold(_ size: CGFloat = 14) -> UIFont {
        .init(name: "MullerBold", size: size) ??
        .systemFont(ofSize: size)
    }
}
