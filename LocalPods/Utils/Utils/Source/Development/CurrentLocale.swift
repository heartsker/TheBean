//
//  Localization.swift
//  Localize
//
//  Created by Daniel Pustotin on 26.04.2022.
//

public extension Locale {
    static var currentLocale: String {
        String(Locale.preferredLanguages[0].split(separator: "-")[0])
    }
}
