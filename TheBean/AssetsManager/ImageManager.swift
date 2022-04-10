//
//  ImageManager.swift
//  TheBean
//
//  Created by Daniel Pustotin on 10.04.2022.
//

import UIKit

class ImageManager: IAssetsManager {
    typealias Asset = UIImage

    static let americano = ImageManager.asset(for: "coffee.americano")
    static let latte = ImageManager.asset(for: "coffee.latte")
    static let flatwhite = ImageManager.asset(for: "coffee.flatwhite")

    static let cup = ImageManager.asset(for: "coffee.cup")
    static let coffeeReady = ImageManager.asset(for: "coffee.ready")
    static let coffeeBeans = ImageManager.asset(for: "coffee.beans")

    static let baristaHands = ImageManager.asset(for: "coffee.barista.hands")

    static let logo = ImageManager.asset(for: "logo")
    static let logoTransparent = ImageManager.asset(for: "logo.transparent")

    // swiftlint:disable:next identifier_name
    static let test_profilePicture = ImageManager.asset(for: "account.profile.picture.test")
}
