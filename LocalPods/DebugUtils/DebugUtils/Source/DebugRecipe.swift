//
//  DebugRecipe.swift
//  DebugUtils
//
//  Created by Daniel Pustotin on 25.04.2022.
//

import Recipe

extension RecipeStep: CustomStringConvertible {
    public var description: String {
        text
    }
}

extension RecipeNutrition: CustomStringConvertible {
    public var description: String {
        "kcal: \(kcal), fat: \(fat), sugars: \(sugars)"
    }
}

extension Recipe: CustomStringConvertible {
    public var description: String {
        "🏁\n" +
        "📝 Title: \(title)\n" +
        "📓 Info: \(info)\n" +
        "⏰ Preparation: \(preparation)\n" +
        "🥵 Difficulty: \(difficulty)\n" +
        "🍽 Ingredients:\n" +
        ingredients
            .map { "\t- \($0)\n" }
            .reduce("", +) +
        "⚡️ Nutrition:\n" +
        "\t\(nutrition.description)\n" +
        "🐾 Steps:\n" +
        steps.map({ "\t- \($0.description)\n" }).reduce("", +) +
        "🏁----------------------------------------------------------------\n"
    }
}
