//
//  CoffeeLocalization.swift
//  TheBean
//
//  Created by Daniel Pustotin on 27.03.2022.
//

 class CoffeeLocalization: ILocalizable {
     static let table: String = "Coffee"

     static let coffee = CoffeeLocalization.localize("coffee")
     static let latte = CoffeeLocalization.localize("latte")
     static let flatwhite = CoffeeLocalization.localize("flatwhite")
     static let americano = CoffeeLocalization.localize("americano")

     static let beans = CoffeeLocalization.localize("coffee.beans")
     static let ready = CoffeeLocalization.localize("coffee.ready")
     static let baristaHands = CoffeeLocalization.localize("coffee.baristaHands")
 }
