//
//  IAssetsManager.swift
//  AssetsManager
//
//  Created by Daniel Pustotin on 10.04.2022.
//

import UIKit

public protocol IAssetsManager {
    associatedtype Asset

    static var defaultAsset: Asset { get }

    static func asset(for string: String) -> Asset
    static func system(name: String) -> Asset
}
