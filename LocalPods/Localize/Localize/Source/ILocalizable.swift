//
//  ILocalizable.swift
//  Localize
//
//  Created by Daniel Pustotin on 27.03.2022.
//

import Utils

/// Protocol for app localization classes
public protocol ILocalizable: AnyObject {
    static var resourcesBundle: Bundle { get }
    static var table: String { get }

    static func localize(_ string: String) -> String
    static func loc(id: String) -> String
}

/// Extends `ILocalizable` with default values
public extension ILocalizable {
    static var resourcesBundle: Bundle {
        Utils.resourcesBundle(of: Self.self)
    }

    static func localize(_ string: String) -> String {
        resourcesBundle.localizedString(forKey: string, value: "", table: table)
    }

    static func loc(id: String) -> String {
        Self.localize(id)
    }
}
