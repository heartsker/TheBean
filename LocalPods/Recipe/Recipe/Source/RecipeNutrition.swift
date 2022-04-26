//
//  RecipeNutrition.swift
//  Recipe
//
//  Created by Daniel Pustotin on 25.04.2022.
//

/// Nutrition of recipe
public class RecipeNutrition {
    /// Number of kcal
    public let kcal: Int
    /// Number of fat (g)
    public let fat: Int
    /// Number of sugars (g)
    public let sugars: Int

    init(kcal: Int, fat: Int, sugars: Int) {
        self.kcal = kcal
        self.fat = fat
        self.sugars = sugars
    }
}
