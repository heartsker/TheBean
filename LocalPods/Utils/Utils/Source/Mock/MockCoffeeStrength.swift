//
//  CoffeeStrength.swift
//  Utils
//
//  Created by Ilya Buldin on 13.04.2022.
//

/// Model to mock RecipesViewController
public enum MockCoffeeStrength: String, CaseIterable {
    case regular
    case strong
    case dessert
}

/// Model to mock RecipesViewController
public extension MockCoffeeStrength {
    // this property is tmp for mock
    var sectionProvider: Int {
        switch self {
        case .regular: return 0
        case .strong: return 1
        case .dessert: return 2
        }
    }
}