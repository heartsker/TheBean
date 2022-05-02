//
//  Localization.swift
//  Localize
//
//  Created by Daniel Pustotin on 26.04.2022.
//

/// Extends Locale with currentLocale
public extension Locale {
    /// Current system locale
    static var currentLocale: String {
        String(Locale.preferredLanguages[0].split(separator: "-")[0])
    }
}
