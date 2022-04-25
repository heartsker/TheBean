//
//  RecipeNutrition.swift
//  Recipe
//
//  Created by Daniel Pustotin on 25.04.2022.
//

import Foundation

public class RecipeNutrition {
    public let kcal: Int
    public let fat: Int
    public let sugars: Int

    init(kcal: Int, fat: Int, sugars: Int) {
        self.kcal = kcal
        self.fat = fat
        self.sugars = sugars
    }
}
