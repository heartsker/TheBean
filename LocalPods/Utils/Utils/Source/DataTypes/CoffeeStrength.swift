//
//  CoffeeStrength.swift
//  Utils
//
//  Created by Ilya Buldin on 13.04.2022.
//

import Foundation

public enum CoffeeStrength: Int, CaseIterable {
    case regular
    case strong
    case dessert

    public var cards: [RecipeCard] {
        switch self {
        case .regular: return RecipeCard.regularCards
        case .strong: return RecipeCard.strongCards
        case .dessert: return RecipeCard.dessertCards
        }
    }

    // TODO: сделать с локализацией
    public var title: String {
        switch self {
        case .regular: return "Regular coffee"
        case .strong: return "Strong coffee"
        case .dessert: return "Dessert coffee"
        }
    }
}
