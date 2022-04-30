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

    public static let coffee = CoffeeLocalization.localize("coffee")
    public static let latte = CoffeeLocalization.localize("latte")
    public static let flatwhite = CoffeeLocalization.localize("flatwhite")
    public static let americano = CoffeeLocalization.localize("americano")

    public static let strengthDesert = CoffeeLocalization.localize("coffee.strength.desert")
    public static let strengthRegular = CoffeeLocalization.localize("coffee.strength.regular")
    public static let strengthStrong = CoffeeLocalization.localize("coffee.strength.strong")
 }
