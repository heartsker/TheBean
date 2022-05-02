//
//  IAssetsManager.swift
//  AssetsManager
//
//  Created by Daniel Pustotin on 10.04.2022.
//

import Utils

/// Protocol for app assets managers
public protocol IAssetsManager: AnyObject {
    associatedtype Asset

    static var resourcesBundle: Bundle { get }

    static var defaultAsset: Asset { get }

    static func asset(for string: String) -> Asset
    static func system(name: String) -> Asset
}

/// Extends `IAssetsManager` with default values
public extension IAssetsManager {
    // swiftlint:disable:next missing_docs
    static var resourcesBundle: Bundle {
        Bundle.resources(for: Self.self)
    }

    /// Finds the asset by given id
    /// - Parameter id: ID of asset
    /// - Returns: Asset with given ID
    static func asset(id: String) -> Asset {
        asset(for: id)
    }
}
