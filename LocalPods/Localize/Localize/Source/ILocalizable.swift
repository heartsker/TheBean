//
//  ILocalizable.swift
//  Localize
//
//  Created by Daniel Pustotin on 27.03.2022.
//

import Foundation
import Utils

public protocol ILocalizable: AnyObject {
    static var resourcesBundle: Bundle { get }
    static var table: String { get }

    static func localize(_ string: String) -> String
    static func loc(id: String) -> String
}

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
