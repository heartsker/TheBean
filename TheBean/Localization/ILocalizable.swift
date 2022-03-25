//
//  Localization.swift
//  TheBean
//
//  Created by Daniel Pustotin on 24.03.2022.
//

import Foundation

// TODO: (DP) Fix protocol naming to IProtocol

protocol ILocalizable {
    static var bundle: Bundle { get }
    static var table: String { get }

    static func localize(_ string: String) -> String
}

extension ILocalizable {
    static var bundle: Bundle {
        Bundle.main
    }

    static func localize(_ string: String) -> String {
        bundle.localizedString(forKey: string, value: "", table: table)
    }
}

prefix operator ^
prefix func ^ (string: String) -> String {
    string.firstUppercased
}
