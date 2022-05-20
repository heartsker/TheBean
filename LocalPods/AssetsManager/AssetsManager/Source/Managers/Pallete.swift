//
//  Pallete.swift
//  AssetsManager
//
//  Created by Daniel Pustotin on 23.04.2022.
//

extension IAssetsManager where Asset: UIColor {
    /// Default asset to use if another does not exist
    public static var defaultAsset: UIColor {
        UIColor.clear
    }

    /// Color  asset by name
    public static func asset(for string: String) -> UIColor {
        UIColor(named: string, in: resourcesBundle, compatibleWith: nil) ?? defaultAsset
    }

    /// System color  asset by name
    public static func system(name: String) -> UIColor {
        UIColor(named: name) ?? defaultAsset
    }
}

/// Manager for app color assets
public class Pallete: IAssetsManager {
    public typealias Asset = UIColor

    public static let background          = Pallete.asset(for: "Background")
    public static let highlightPrimary    = Pallete.asset(for: "HighlightPrimary")
    public static let hightlightSecondary = Pallete.asset(for: "HighlightSecondary")
    public static let hightlightThirdly   = Pallete.asset(for: "HighlightThirdly")
    public static let materialHeavy       = Pallete.asset(for: "MaterialHeavy")
    public static let materialMedium      = Pallete.asset(for: "MaterialMedium")
    public static let materialLight       = Pallete.asset(for: "MaterialLight")
    public static let accentColor         = Pallete.asset(for: "AccentColor")
    public static let strokeColor         = Pallete.asset(for: "Stroke")
    public static let materialStrong      = Pallete.asset(for: "MaterialStrong")
}
