//
//  ControllerLocalization.swift
//  TheBean
//
//  Created by Daniel Pustotin on 27.03.2022.
//

class ControllerLocalization: ILocalizable {
    static let table: String = "Controller"

    static let recipes = ControllerLocalization.localize("recipes")
    static let statistics = ControllerLocalization.localize("statistics")
    static let timer = ControllerLocalization.localize("timer")
    static let account = ControllerLocalization.localize("account")
    static let test = ControllerLocalization.localize("test")
}
