//
//  IDManager.swift
//  Utils
//
//  Created by Daniel Pustotin on 25.04.2022.
//

import Foundation

public extension String {
    static func id(of drinkKind: DrinkKind) -> String {
        "coffee." + drinkKind.rawValue
    }
}
