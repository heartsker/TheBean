//
//  RecipeCard.swift
//  TheBean
//
//  Created by Ilya Buldin on 11.04.2022.
//

import Foundation

struct RecipeCardModel {
    let title: String
    let drinkKind: DrinkKind
    let volume: Int
    let cookingTime: Int
}

extension RecipeCardModel {

    static let regularCards: [RecipeCardModel] = {
        let items: [RecipeCardModel] = [
            .init(title: "Latte", drinkKind: .latte, volume: 300, cookingTime: 10),
            .init(title: "Flat White", drinkKind: .flatwhite, volume: 250, cookingTime: 11),
            .init(title: "Americano", drinkKind: .americano, volume: 300, cookingTime: 13),
            .init(title: "Latte", drinkKind: .latte, volume: 300, cookingTime: 10),
            .init(title: "Flat White", drinkKind: .flatwhite, volume: 250, cookingTime: 11)
        ]
        return items
    }()

    static let strongCards: [RecipeCardModel] = {
        let items: [RecipeCardModel] = [
            .init(title: "Latte", drinkKind: .latte, volume: 300, cookingTime: 10),
            .init(title: "Flat White", drinkKind: .flatwhite, volume: 250, cookingTime: 11),
            .init(title: "Americano", drinkKind: .americano, volume: 300, cookingTime: 13),
            .init(title: "Latte", drinkKind: .latte, volume: 300, cookingTime: 10),
            .init(title: "Flat White", drinkKind: .flatwhite, volume: 250, cookingTime: 11)
        ]
        return items
    }()

    static let dessertCards: [RecipeCardModel] = {
        let items: [RecipeCardModel] = [
            .init(title: "Latte", drinkKind: .latte, volume: 300, cookingTime: 10),
            .init(title: "Flat White", drinkKind: .flatwhite, volume: 250, cookingTime: 11),
            .init(title: "Americano", drinkKind: .americano, volume: 300, cookingTime: 13),
            .init(title: "Latte", drinkKind: .latte, volume: 300, cookingTime: 10),
            .init(title: "Flat White", drinkKind: .flatwhite, volume: 250, cookingTime: 11)
        ]
        return items
    }()
}
