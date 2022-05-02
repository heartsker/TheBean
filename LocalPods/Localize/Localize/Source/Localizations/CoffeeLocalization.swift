//
//  CoffeeLocalization.swift
//  Localize
//
//  Created by Daniel Pustotin on 27.03.2022.
//

import Utils

/// Localization for Coffee
public class CoffeeLocalization: ILocalizable {
    public static let table: String = "Coffee"

    public static let coffee = CoffeeLocalization.localize(id: "coffee")
    public static let latte = CoffeeLocalization.localize(id: "latte")
    public static let flatwhite = CoffeeLocalization.localize(id: "flatwhite")
    public static let americano = CoffeeLocalization.localize(id: "americano")

    public static let strengthDesert = CoffeeLocalization.localize(id: "coffee.strength.desert")
    public static let strengthRegular = CoffeeLocalization.localize(id: "coffee.strength.regular")
    public static let strengthStrong = CoffeeLocalization.localize(id: "coffee.strength.strong")
 }
