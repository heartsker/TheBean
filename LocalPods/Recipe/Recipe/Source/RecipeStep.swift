//
//  RecipeStep.swift
//  Pods
//
//  Created by Daniel Pustotin on 25.04.2022.
//

/// Recipe cooking step
public class RecipeStep {
    /// Text of recipe step
    public let text: String
    /// ID of image for recipe step or empty string if none
    public let imageID: String

    init(text: String, imageID: String) {
        self.text = text
        self.imageID = imageID
    }
}
