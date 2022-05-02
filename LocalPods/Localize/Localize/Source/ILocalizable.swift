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

    static func localize(id: String) -> String
}

/// Extends `ILocalizable` with default values
public extension ILocalizable {
    // swiftlint:disable:next missing_docs
    static var resourcesBundle: Bundle {
        Bundle.resources(for: Self.self)
    }

    /// Localizes the string
    /// - Parameter string: String id to localize
    /// - Returns: Localized string
    static func localize(id: String) -> String {
        resourcesBundle.localizedString(forKey: id, value: "", table: table)
    }
}
