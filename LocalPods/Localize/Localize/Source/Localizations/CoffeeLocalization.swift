//
//  CoffeeLocalization.swift
//  Localize
//
//  Created by Daniel Pustotin on 27.03.2022.
//

import Utils

public class CoffeeLocalization: ILocalizable {
    public static let table: String = "Coffee"

    public static let coffee = CoffeeLocalization.localize("coffee")
    public static let latte = CoffeeLocalization.localize("latte")
    public static let flatwhite = CoffeeLocalization.localize("flatwhite")
    public static let americano = CoffeeLocalization.localize("americano")
 }
