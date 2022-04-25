//
//  RecipeStep.swift
//  Pods
//
//  Created by Daniel Pustotin on 25.04.2022.
//

import Foundation

public class RecipeStep {
    public let text: String
    public let imageID: String

    init(text: String, imageID: String) {
        self.text = text
        self.imageID = imageID
    }
}
