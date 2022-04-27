//
//  IDManager.swift
//  Utils
//
//  Created by Daniel Pustotin on 25.04.2022.
//

public extension String {
    static func id(of drinkKind: DrinkKind) -> String {
        "coffee." + drinkKind.rawValue
    }

    static func id(of strength: MockCoffeeStrength) -> String {
        "coffee.strength." + strength.rawValue
    }
}
