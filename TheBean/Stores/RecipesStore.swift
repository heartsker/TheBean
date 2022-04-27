//
//  RecipesStore.swift
//  TheBean
//
//  Created by Ilya Buldin on 14.04.2022.
//

import Combine
import Utils

// Store example
final class RecipesStore: ObservableObject {

    static let shared = RecipesStore()

    private init() {
        startReceiptsCoreDataPipeline()
    }

    @Published var recipes: [MockRecipeCard] = []

    private var cancelBag = Set<AnyCancellable>()

    private func startReceiptsCoreDataPipeline() {
        // Listening to
    }
}
