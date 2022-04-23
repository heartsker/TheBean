//
//  FontManager.swift
//  AssetsManager
//
//  Created by Daniel Pustotin on 23.04.2022.
//

import Foundation

public extension IAssetsManager where Asset: UIFont {
    static var defaultAsset: UIFont {
        UIFont()
    }

    static var defaultFontSize: CGFloat {
        16
    }

    static func asset(for string: String) -> UIFont {
        UIFont(name: string, size: defaultFontSize) ?? defaultAsset
    }

    static func asset(for string: String, size: CGFloat) -> UIFont {
        UIFont(name: string, size: size) ?? defaultAsset
    }

    static func system(name: String) -> UIFont {
        UIFont.systemFont(ofSize: defaultFontSize)
    }
}

public class FontManager: IAssetsManager {
    public typealias Asset = UIFont

    private static let fontFamily = "Muller"

    public static func light(_ size: CGFloat = defaultFontSize) -> UIFont {
        FontManager.asset(for: fontFamily + "Light", size: size)
    }

    public static func regular(_ size: CGFloat = defaultFontSize) -> UIFont {
        FontManager.asset(for: fontFamily + "Regular", size: size)
    }

    public static func medium(_ size: CGFloat = defaultFontSize) -> UIFont {
        FontManager.asset(for: fontFamily + "Medium", size: size)
    }

    public static func bold(_ size: CGFloat = defaultFontSize) -> UIFont {
        FontManager.asset(for: fontFamily + "Bold", size: size)
    }
}
