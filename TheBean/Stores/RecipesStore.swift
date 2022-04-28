//
//  RecipesStore.swift
//  TheBean
//
//  Created by Ilya Buldin on 14.04.2022.
//

import Combine
import Utils

// Store example
final class RecipesStore {

    static let shared = RecipesStore()

    var recipes: [MockRecipeCard] = []

    private init() {
    }
}
