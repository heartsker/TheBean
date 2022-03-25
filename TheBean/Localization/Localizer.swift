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

    case controllerRecipes = "controller.recipes"
    case controllerStatistics = "controller.statistics"
    case controllerTimer = "controller.timer"
    case controllerTest = "controller.test"

    case statisticsPersonalRecommendations = "statistics.personalRecommendations"

    case statisticsGlobalStatistics = "statistics.globalStatistics"
}

prefix operator ^
prefix func ^ (string: Localizer) -> String {
    (~string).firstUppercased
}

prefix operator ~
prefix func ~ (string: Localizer) -> String {
    NSLocalizedString(string.rawValue, comment: "")
}
