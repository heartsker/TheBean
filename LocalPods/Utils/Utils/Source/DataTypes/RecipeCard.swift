//
//  RecipeCard.swift
//  Utils
//
//  Created by Daniel Pustotin on 25.04.2022.
//

public struct RecipeCard {
    public let title: String
    public let drinkKind: DrinkKind
    public let volume: Int
    public let cookingTime: Int
}

extension RecipeCard {

    static let regularCards: [RecipeCard] = {
        let items: [RecipeCard] = [
            .init(title: "Latte", drinkKind: .latte, volume: 300, cookingTime: 10),
            .init(title: "Flat White", drinkKind: .flatwhite, volume: 250, cookingTime: 11),
            .init(title: "Americano", drinkKind: .americano, volume: 300, cookingTime: 13),
            .init(title: "Latte", drinkKind: .latte, volume: 300, cookingTime: 10)
        ]
        return items
    }()

    static let strongCards: [RecipeCard] = {
        let items: [RecipeCard] = [
            .init(title: "Latte", drinkKind: .latte, volume: 300, cookingTime: 10),
            .init(title: "Flat White", drinkKind: .flatwhite, volume: 250, cookingTime: 11),
            .init(title: "Americano", drinkKind: .americano, volume: 300, cookingTime: 13),
            .init(title: "Latte", drinkKind: .latte, volume: 300, cookingTime: 10)
        ]
        return items
    }()

    static let dessertCards: [RecipeCard] = {
        let items: [RecipeCard] = [
            .init(title: "Latte", drinkKind: .latte, volume: 300, cookingTime: 10),
            .init(title: "Flat White", drinkKind: .flatwhite, volume: 250, cookingTime: 11),
            .init(title: "Americano", drinkKind: .americano, volume: 300, cookingTime: 13),
            .init(title: "Latte", drinkKind: .latte, volume: 300, cookingTime: 10)
        ]
        return items
    }()
}
