//
//  Recipe.swift
//  Recipe
//
//  Created by Daniel Pustotin on 25.04.2022.
//

import Foundation

public class Recipe {
    var title: String
    var description: String
    var info: String
    var imageID: String
    var steps: [RecipeStep]

    init(_ title: String, description: String, info: String, imageID: String, steps: [RecipeStep]) {
        self.title = title
        self.description = description
        self.info = info
        self.imageID = imageID
        self.steps = steps
    }
}
