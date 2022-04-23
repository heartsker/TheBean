//
//  DrinkKind.swift
//  TheBean
//
//  Created by Daniel Pustotin on 05.02.2022.
//

import UIKit
import AssetsManager

enum DrinkKind {
    case latte
    case flatwhite
    case americano

    var imageName: UIImage? {
        switch self {
        case .americano: return ImageManager.americano
        case .flatwhite: return ImageManager.flatwhite
        case .latte: return ImageManager.latte
        }
    }
}
