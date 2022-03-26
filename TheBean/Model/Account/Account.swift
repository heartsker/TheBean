//
//  Account.swift
//  TheBean
//
//  Created by Daniel Pustotin on 05.02.2022.
//

import UIKit

final class Account {
    private var _username: String?
    private var _email: String?
    var picture: UIImage?

    private(set) var username: String {
        get {
            _username ?? "heartsker"
        }
        set {
            _username = newValue
        }
    }

    private(set) var email: String {
        get {
            _email ?? "heartsker@gmail.com"
        }
        set {
            _email = newValue
        }
    }

    private var drinkHistory: [DrinkKind: Int] = [:]

    /// Total number of cups user took.
    var cupsCount: Int {
        drinkHistory.reduce(0) { partialResult, element in
            partialResult + element.value
        }
    }

    /// Total number of drink types user made.
    var recipesCount: Int {
        drinkHistory.keys.count
    }

    /// The drink that user took the most number of times.
    var favouriteDrink: DrinkKind? {
        drinkHistory.max(by: {$0.value > $1.value})?.key
    }

    var healthScore: Int {
        10
    }

    var level: Int {
        80
    }

    // MARK: - Methods

    /// Add drink to user's history.
    /// - Parameters:
    ///   - drink: kind of drink user took
    ///   - count: number of cups
    func takeCup(of drink: DrinkKind, count: Int = 1) {
        drinkHistory[drink] = drinkHistory[drink] ?? 0 + 1
    }
}
