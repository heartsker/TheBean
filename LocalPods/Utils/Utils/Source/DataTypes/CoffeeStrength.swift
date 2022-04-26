//
//  CoffeeStrength.swift
//  Utils
//
//  Created by Ilya Buldin on 13.04.2022.
//

public enum CoffeeStrength: String, CaseIterable {
    case regular
    case strong
    case dessert

    // TODO: - (IB) Remove this property from this enum
    public var cards: [RecipeCard] {
        switch self {
        case .regular: return RecipeCard.regularCards
        case .strong: return RecipeCard.strongCards
        case .dessert: return RecipeCard.dessertCards
        }
    }
}
