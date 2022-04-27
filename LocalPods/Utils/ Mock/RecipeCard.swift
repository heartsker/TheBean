//
//  RecipeCard.swift
//  Utils
//
//  Created by Daniel Pustotin on 25.04.2022.
//

public struct MockRecipeCard {
    public let title: String
    public let drinkKind: DrinkKind
    public let volume: Int
    public let cookingTime: Int
}

public extension MockRecipeCard {

    static let makeCards: (MockCoffeeStrength) -> [Self] = { strength in
        switch strength {
        case .regular: return Self.regularCards
        case .dessert: return Self.dessertCards
        case .strong: return Self.strongCards
        }
    }

    static let regularCards: [Self] = {
        let items: [Self] = [
            .init(title: "Latte", drinkKind: .latte, volume: 300, cookingTime: 10),
            .init(title: "Flat White", drinkKind: .flatwhite, volume: 250, cookingTime: 11),
            .init(title: "Americano", drinkKind: .americano, volume: 300, cookingTime: 13),
            .init(title: "Latte", drinkKind: .latte, volume: 300, cookingTime: 10)
        ]
        return items
    }()

    static let strongCards: [Self] = {
        let items: [Self] = [
            .init(title: "Latte", drinkKind: .latte, volume: 300, cookingTime: 10),
            .init(title: "Flat White", drinkKind: .flatwhite, volume: 250, cookingTime: 11),
            .init(title: "Americano", drinkKind: .americano, volume: 300, cookingTime: 13),
            .init(title: "Latte", drinkKind: .latte, volume: 300, cookingTime: 10)
        ]
        return items
    }()

    static let dessertCards: [Self] = {
        let items: [Self] = [
            .init(title: "Latte", drinkKind: .latte, volume: 300, cookingTime: 10),
            .init(title: "Flat White", drinkKind: .flatwhite, volume: 250, cookingTime: 11),
            .init(title: "Americano", drinkKind: .americano, volume: 300, cookingTime: 13),
            .init(title: "Latte", drinkKind: .latte, volume: 300, cookingTime: 10)
        ]
        return items
    }()
}
