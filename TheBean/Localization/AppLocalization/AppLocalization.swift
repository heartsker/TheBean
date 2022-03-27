//
//  AppLocalization.swift
//  TheBean
//
//  Created by Daniel Pustotin on 25.03.2022.
//

import Foundation

class AppLocalization: ILocalizable {
    static let table: String = "App"

    static let name = AppLocalization.localize("name")
}
