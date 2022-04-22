//
//  IAssetsManager.swift
//  TheBean
//
//  Created by Daniel Pustotin on 10.04.2022.
//

import UIKit

protocol IAssetsManager {
    associatedtype Asset

    static var defaultAsset: Asset { get }

    static func asset(for string: String) -> Asset
    static func system(name: String) -> Asset
}

extension IAssetsManager where Asset: UIImage {

    static var defaultAsset: Asset {
        Asset(systemName: "questionmark.app.dashed")!
    }

    static func asset(for string: String) -> Asset {
        Asset(named: string) ?? defaultAsset
    }

    static func system(name: String) -> Asset {
        Asset(systemName: name) ?? defaultAsset
    }
}
