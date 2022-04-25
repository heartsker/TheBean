//
//  ImageManager.swift
//  AssetsManager
//
//  Created by Daniel Pustotin on 10.04.2022.
//

import UIKit

public extension IAssetsManager where Asset: UIImage {
    static var defaultAsset: Asset {
        Asset(systemName: "questionmark.app.dashed")!
    }

    static func asset(for string: String) -> Asset {
        Asset(named: string, in: resourcesBundle, compatibleWith: nil) ?? defaultAsset
    }

    static func system(name: String) -> Asset {
        return Asset(systemName: name) ?? defaultAsset
    }
}

public class ImageManager: IAssetsManager {
    public typealias Asset = UIImage

    public static let americano =       ImageManager.asset(for: "coffee.americano")
    public static let latte =           ImageManager.asset(for: "coffee.latte")
    public static let flatwhite =       ImageManager.asset(for: "coffee.flatwhite")

    public static let cup =             ImageManager.asset(for: "coffee.cup")
    public static let coffeeReady =     ImageManager.asset(for: "coffee.ready")
    public static let coffeeBeans =     ImageManager.asset(for: "coffee.beans")

    public static let baristaHands =    ImageManager.asset(for: "coffee.barista.hands")

    public static let logo =            ImageManager.asset(for: "logo")
    public static let logoTransparent = ImageManager.asset(for: "logo.transparent")

    public static let profilePicture =  ImageManager.system(name: "person.fill")
}
