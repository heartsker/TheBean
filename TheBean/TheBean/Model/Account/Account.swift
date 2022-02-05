//
//  Account.swift
//  TheBean
//
//  Created by Daniel Pustotin on 05.02.2022.
//

import Foundation

final class Account {
    private(set) var username: String?
    private(set) var email: String?
    
    private var drinkHistory: [DrinkKind: Int] = [:]
    
    /// Total number of cups user took.
    var cupsCount: Int {
        drinkHistory.reduce(0) { partialResult, element in
            partialResult + element.value
        }
    }
    /// The drink that user took the most number of times.
    var favouriteDrink: DrinkKind? {
        drinkHistory.max(by: {$0.value > $1.value})?.key
    }
    
    /// Add drink to user's history.
    /// - Parameters:
    ///   - drink: kind of drink user took
    ///   - count: number of cups
    func takeCup(of drink: DrinkKind, count: Int = 1) {
        drinkHistory[drink] = drinkHistory[drink] ?? 0 + 1
    }
    
}
