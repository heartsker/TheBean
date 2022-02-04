//
//  Recipe.swift
//  TheBean
//
//  Created by Daniel Pustotin on 01.02.2022.
//

import Foundation
import UIKit

class Recipe {
    var title: String
    var info: String
    var image: UIImage
    
    init(_ title: String, _ info: String, img image: UIImage) {
        self.title = title
        self.info = info
        self.image = image
    }
}
