//
//  RecipeStep.swift
//  Pods
//
//  Created by Daniel Pustotin on 25.04.2022.
//

import Foundation

class RecipeStep {
    var text: String
    var imageID: String

    init(text: String, imageID: String) {
        self.text = text
        self.imageID = imageID
    }
}
