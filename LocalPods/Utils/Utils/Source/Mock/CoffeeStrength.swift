//
//  CoffeeStrength.swift
//  Utils
//
//  Created by Ilya Buldin on 13.04.2022.
//

/// Model of coffee strenght
public enum CoffeeStrength: String, CaseIterable {
    case regular
    case strong
    case dessert
}

/// Extends model with mock for RecipesViewController
public extension CoffeeStrength {
    /// Number of the section
    var sectionNumber: Int {
        switch self {
        case .regular: return 0
        case .strong: return 1
        case .dessert: return 2
        }
    }
}
