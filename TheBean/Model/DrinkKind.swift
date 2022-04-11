//
//  DrinkKind.swift
//  TheBean
//
//  Created by Daniel Pustotin on 05.02.2022.
//

import UIKit

enum DrinkKind: String {
    case latte = "coffee.latte"
    case flatwhite = "flatwhite"
    case americano

    var imageName: UIImage? {
        switch self {
        case .americano: return ImageManager.americano
        case .flatwhite: return ImageManager.flatwhite
        case .latte: return ImageManager.latte
        default: return UIImage(systemName: "photo")
        }
    }
}
