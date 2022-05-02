//
//  FontManager.swift
//  AssetsManager
//
//  Created by Daniel Pustotin on 23.04.2022.
//

extension IAssetsManager where Asset: UIFont {
    /// Default asset to use if another does not exist
    public static var defaultAsset: UIFont {
        UIFont()
    }

    private static var defaultFontSize: CGFloat {
        16
    }

    /// Font asset by name with default size
    public static func asset(for string: String) -> UIFont {
        UIFont(name: string, size: defaultFontSize) ?? defaultAsset
    }

    /// Font asset by name and size
    static func asset(for string: String, size: CGFloat) -> UIFont {
        UIFont(name: string, size: size) ?? defaultAsset
    }

    /// System font with default size
    public static func system(name: String) -> UIFont {
        UIFont.systemFont(ofSize: defaultFontSize)
    }
}

/// Manager for app font assets
public class FontManager: IAssetsManager {
    public typealias Asset = UIFont

    private static let fontFamily = "Muller"
    public static let defaultFontSize: CGFloat = 16

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
