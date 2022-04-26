//
//  RecipeManager.swift
//  Pods
//
//  Created by Daniel Pustotin on 25.04.2022.
//

import Utils

/// Provides functionality for loading recipes from file
public class RecipeManager {

    /// Loads recipes from file `Recipes.json`
    /// - Returns: Array of `Recipe` or `nil` if failed to load
    public static func loadRecipes() -> [Recipe]? {
        guard let json = FileManager.json(            from: "Recipes",
                                                      in: resourcesBundle(of: RecipeManager.self),
                                                      localize: true) else {
            return nil
        }

        var recipes: [Recipe] = []
        for recipe in json {
            let title = recipe.key
            guard let value = recipe.value as? Json,
                  let info = value["info"] as? String,
                  let preparation = value["preparation"] as? String,
                  let difficulty = value["difficulty"] as? String,
                  let imageID: String = value["imageID"] as? String,
                  let ingredients = value["ingredients"] as? [String],
                  let nutritionJson = value["nutrition"] as? Json,
                  let stepsJsons = value["steps"] as? [Json] else {
                return nil
            }

            guard let kcal = nutritionJson["kcal"] as? Int,
                  let fat = nutritionJson["fat"] as? Int,
                  let sugars = nutritionJson["sugars"] as? Int else {
                return nil
            }
            let nutrition = RecipeNutrition(kcal: kcal, fat: fat, sugars: sugars)

            var steps: [RecipeStep]? = []
            for step in stepsJsons {
                guard let text = step["text"] as? String,
                      let imageID = step["imageID"] as? String else {
                    steps = nil
                    break
                }
                steps?.append(RecipeStep(text: text, imageID: imageID))
            }
            recipes.append(Recipe(title: title,
                                  info: info,
                                  preparation: preparation,
                                  difficulty: difficulty,
                                  imageID: imageID,
                                  ingredients: ingredients,
                                  nutrition: nutrition,
                                  steps: steps ?? [])
            )
        }
        return recipes
    }
}
