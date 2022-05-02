//
//  Recipe.swift
//  Recipe
//
//  Created by Daniel Pustotin on 25.04.2022.
//

/// Class for recipe
public class Recipe {
    // swiftlint:disable missing_docs
    public let title: String
    public let info: String
    public let preparation: String
    public let difficulty: String
    public let imageID: String
    public let ingredients: [String]
    public let nutrition: RecipeNutrition
    public let steps: [RecipeStep]
    // swiftlint:enable missing_docs

    init(title: String,
         info: String,
         preparation: String,
         difficulty: String,
         imageID: String,
         ingredients: [String],
         nutrition: RecipeNutrition,
         steps: [RecipeStep]) {
        self.title = title
        self.info = info
        self.preparation = preparation
        self.difficulty = difficulty
        self.imageID = imageID
        self.ingredients = ingredients
        self.nutrition = nutrition
        self.steps = steps
    }
}
