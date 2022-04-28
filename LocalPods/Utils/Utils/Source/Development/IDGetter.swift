//
//  IDManager.swift
//  Utils
//
//  Created by Daniel Pustotin on 25.04.2022.
//

/// Provides id getter for basic types
public extension String {
    static func id(of drinkKind: DrinkKind) -> String {
        "coffee." + drinkKind.rawValue
    }

    static func id(of strength: CoffeeStrength) -> String {
        "coffee.strength." + strength.rawValue
    }
}
