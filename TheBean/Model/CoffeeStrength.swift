//
//  CoffeeStrength.swift
//  TheBean
//
//  Created by Ilya Buldin on 13.04.2022.
//

import Foundation

enum CoffeeStrength: Int, CaseIterable {
    case regular
    case strong
    case dessert

    var cards: [RecipeCardModel] {
        switch self {
        case .regular: return RecipeCardModel.regularCards
        case .strong: return RecipeCardModel.strongCards
        case .dessert: return RecipeCardModel.dessertCards
        }
    }

    // TODO: сделать с локализацией
    var title: String {
        switch self {
        case .regular: return "Regular coffee"
        case .strong: return "Strong coffee"
        case .dessert: return "Dessert coffee"
        }
    }
}
