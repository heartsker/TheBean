//
//  ILocalizable.swift
//  Localize
//
//  Created by Daniel Pustotin on 27.03.2022.
//

import Foundation

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
