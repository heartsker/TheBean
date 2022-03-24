//
//  Localizer.swift
//  TheBean
//
//  Created by Daniel Pustotin on 24.03.2022.
//

import Foundation

enum Localizer: String {
    case appName = "app.name"

    case coffee = "coffee"
    case coffeeLatte = "coffee.latte"
    case coffeeFlatwhite = "coffee.flatwhite"
    case coffeeAmericano = "coffee.americano"
}

prefix operator ^
prefix func ^ (string: Localizer) -> String {
    (~string).firstUppercased
}

prefix operator ~
prefix func ~ (string: Localizer) -> String {
    NSLocalizedString(string.rawValue, comment: "")
}
