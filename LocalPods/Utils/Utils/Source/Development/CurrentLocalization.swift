//
//  CurrentLocalization.swift
//  Utils
//
//  Created by Daniel Pustotin on 25.04.2022.
//

public func currentLocale() -> String {
    String(Locale.preferredLanguages[0].split(separator: "-")[0])
}
