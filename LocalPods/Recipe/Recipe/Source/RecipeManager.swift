//
//  RecipeManager.swift
//  Pods
//
//  Created by Daniel Pustotin on 25.04.2022.
//

import Utils

class RecipeManager {
    static func loadRecipes() -> [Recipe]? {
        guard let json = FileManager.json(from: "Recipes", in: resourcesBundle(of: RecipeManager.self)) else {
            return nil
        }
        
        var recipes = [Recipe] = []
        for (key, value) in json {
            guard let title = key,
                  let value = value as? Json,
                  let description = value["description"] as? String,
                  let info: String = value["info"] as? String,
                  let imageID: String = value["imageID"] as? String,
                  let stepsJson = value["steps"] as? [Json] else {
                return nil
            }
            var steps: [RecipeStep]? = []
            for step in stepsJson {
                guard let text = step["text"] as? String,
                      let imageID = step["imageID"] as? String else {
                    steps = nil
                    break
                }
                recipeSteps?.append(RecipeStep(text: text, imageID: imageID))
            }
            recipes.append(Recipe(title, description: description, info: info, imageID: imageID, steps: steps))
        }
    }
}
