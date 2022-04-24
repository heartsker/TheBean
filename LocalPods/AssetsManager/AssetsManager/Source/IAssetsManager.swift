//
//  IAssetsManager.swift
//  AssetsManager
//
//  Created by Daniel Pustotin on 10.04.2022.
//

import DevelopmentUtils

protocol IAssetsManager: AnyObject {
    associatedtype Asset

    static var resourcesBundle: Bundle { get }

    static var defaultAsset: Asset { get }

    static func asset(for string: String) -> Asset
    static func system(name: String) -> Asset
}

extension IAssetsManager {
    static var resourcesBundle: Bundle {
        DevelopmentUtils.resourcesBundle(of: Self.self)
    }
}
